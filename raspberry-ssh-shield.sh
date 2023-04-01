#!/bin/bash

# Replace 'newuser' with the desired username and 'password' with a strong password
USERNAME="newuser"
PASSWORD="password"

# Add the user and set the password
useradd -m ${USERNAME}
echo "${USERNAME}:${PASSWORD}" | chpasswd

# Add the user to the sudoers group (usually 'sudo' or 'wheel')
# Uncomment the line that corresponds to your system
#usermod -aG sudo ${USERNAME} # for Debian/Ubuntu systems
#usermod -aG wheel ${USERNAME} # for CentOS/RHEL systems

# Edit the SSH configuration file to set the desired options
SSHD_CONFIG="/etc/ssh/sshd_config"
{
  echo "ClientAliveInterval 360"
  echo "ClientAliveCountMax 0"
  echo "PermitEmptyPasswords no"
  echo "Protocol 2"
  echo "Port 222"
} >> ${SSHD_CONFIG}

# Restart the SSH service to apply the changes
# Uncomment the line that corresponds to your system
#service ssh restart # for Debian/Ubuntu systems
#systemctl restart sshd # for CentOS/RHEL systems

echo "SSH hardening complete."
