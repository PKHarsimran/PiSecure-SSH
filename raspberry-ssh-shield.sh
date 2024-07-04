#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Replace 'newuser' with the desired username and 'password' with a strong password
USERNAME="newuser"
PASSWORD="password"

# Function to print error messages
error() {
    echo "Error: $1" >&2
    exit 1
}

# Add the user and set the password
if id "${USERNAME}" &>/dev/null; then
    error "User '${USERNAME}' already exists."
else
    useradd -m "${USERNAME}" || error "Failed to add user '${USERNAME}'."
    echo "${USERNAME}:${PASSWORD}" | chpasswd || error "Failed to set password for user '${USERNAME}'."
fi

# Add the user to the sudoers group (usually 'sudo' or 'wheel')
if grep -qEi "(debian|ubuntu)" /etc/*release; then
    usermod -aG sudo "${USERNAME}" || error "Failed to add user '${USERNAME}' to 'sudo' group."
elif grep -qEi "(centos|rhel|fedora)" /etc/*release; then
    usermod -aG wheel "${USERNAME}" || error "Failed to add user '${USERNAME}' to 'wheel' group."
else
    error "Unsupported OS."
fi

# Edit the SSH configuration file to set the desired options
SSHD_CONFIG="/etc/ssh/sshd_config"
{
  echo "ClientAliveInterval 360"
  echo "ClientAliveCountMax 0"
  echo "PermitEmptyPasswords no"
  echo "Protocol 2"
  echo "Port 222"
} >> "${SSHD_CONFIG}"

# Restart the SSH service to apply the changes
if systemctl list-units --type=service | grep -q sshd; then
    systemctl restart sshd || error "Failed to restart sshd service."
elif systemctl list-units --type=service | grep -q ssh; then
    systemctl restart ssh || error "Failed to restart ssh service."
else
    error "SSH service not found."
fi

echo "SSH hardening complete."
