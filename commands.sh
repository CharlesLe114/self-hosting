# https://monovm.com/blog/how-to-setup-vps-for-beginners/
# Create new user
sudo adduser newusername

# Grant sudo
sudo usermod -aG sudo newusername

# Modify privileges
sudo visudo
newusername ALL=(ALL:ALL) ALL #to allow the user to run all commands with sudo privileges

# Disable Root Login (Optional but Recommended):
# For security reasons, it's advisable to disable direct root logins and use sudo for administrative tasks. To do this, you can edit the SSH configuration file:
# Find the line that says PermitRootLogin yes and change it to PermitRootLogin no
sudo nano /etc/ssh/sshd_config


# Test new user
ssh newusername@your_server_ip


# Set Up SSH Key-Based Authentication (Optional but Recommended):


# Disable Password Authentication (Optional but Recommended):

# Setup SSH for new user
