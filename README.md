# 🔒 Secure SSH Setup Script

## 📖 Overview

The `secure-ssh-setup.sh` script is designed to automate the process of securing an SSH server by performing the following tasks:
- Adding a new user with a specified username and password.
- Adding the new user to the appropriate sudo group based on the operating system.
- Updating the SSH configuration file with security enhancements.
- Restarting the SSH service to apply the changes.

## ✨ Features

- Adds a new user and sets their password.
- Adds the user to the `sudo` group (Debian/Ubuntu) or `wheel` group (CentOS/RHEL/Fedora).
- Updates SSH configuration settings:
  - `ClientAliveInterval`
  - `ClientAliveCountMax`
  - `PermitEmptyPasswords`
  - `Protocol`
  - `Port`
- Restarts the SSH service to apply the new settings.
- Provides detailed logging for each step.

## ⚙️ Prerequisites

- A Linux-based system (Debian, Ubuntu, CentOS, RHEL, Fedora).
- Root or sudo access to run the script.

## 🚀 Usage

1. **Download the Script:**

   Clone the repository or download the `secure-ssh-setup.sh` script to your local machine.

   ```sh
   git clone https://github.com/PKHarsimran/PiSecure-SSH.git
   cd PiSecure-SSH/scripts
   ```

2. **Modify the Script:**

   Open the script and update the **USERNAME** and **PASSWORD** variables with your desired values.

   ```sh
   USERNAME="newuser"
   PASSWORD="password"
   ```

3. **Run the Script:**

   Execute the script with root or sudo privileges.
   
   ```sh
   sudo bash secure-ssh-setup.sh
   ```

## 📜 Logging

The script provides detailed logging at each step to ensure that users are informed of the progress and any potential issues.

