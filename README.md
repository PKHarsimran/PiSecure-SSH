**SSHieldPi - The Raspberry Pi SSH Protection Solution**

SSHieldPi is a powerful and user-friendly bash script tailored to safeguard your Raspberry Pi's SSH access. This script not only helps you create and manage user accounts with sudo privileges, but also fine-tunes your SSH configuration for optimal security. Say goodbye to security loopholes and protect your Raspberry Pi with SSHieldPi.
Features

- Add a new user with a custom username and password
- Grant sudo privileges to the new user
- Configure SSH settings for increased security
- Modify SSH port to a custom value
- Restart the SSH service to apply changes

**Prerequisites**

- Raspberry Pi with Raspbian or a compatible OS
- Root or sudo access to the Raspberry Pi

**Installation**

1. Clone the SSHieldPi repository:

          git clone https://github.com/PKHarsimran/SSHieldPi-The-Raspberry-Pi-SSH-Protection-Solution.git
          
2. Navigate to the SSHieldPi directory:

          cd SSHieldPi

3. Make the script executable:

          chmod +x sshieldpi.sh
          
**Usage**

4. Open sshieldpi.sh in a text editor and replace the placeholders for USERNAME and PASSWORD with the desired username and a strong password.
5. Uncomment the appropriate lines depending on whether you are using a Debian/Ubuntu or CentOS/RHEL system.
6. Run the script as root or with sudo privileges:

          sudo ./sshieldpi.sh

7. The script will create a new user, grant sudo privileges, and apply the recommended SSH settings. The SSH service will be restarted to apply the changes.
8. Test the new SSH configuration by logging in with the newly created user and the custom SSH port.

**Contributing**
We welcome contributions to the SSHieldPi project. If you have ideas for improvements, bug fixes, or new features, please feel free to submit a pull request or open an issue.

            
