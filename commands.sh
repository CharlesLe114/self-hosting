# https://monovm.com/blog/how-to-setup-vps-for-beginners/
# yum repos mirror to vault sed
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Create new user
sudo adduser newusername
sudo passwd username

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

# Copy code-server-data from old server 
docker volume ls 
docker inspect volume_name | grep Mountpoint

### zip into tar - this is optional, due to VPS free storage #######
sudo tar -cvf volume1_data.tar -C /var/lib/docker/volumes/volume_name/_data .
nohup rsync volume1_data.tar user@newserver:/path/to/directory
docker volume create volume_name
sudo tar -xvf /path/to/directory/volume1_data.tar -C /var/lib/docker/volumes/volume_name/_data

#### if not using zip #####
nohup rsync mountpoint user@newserver:/path/to/directory
docker volume create volume_name
mv /path/to/directory /var/lib/docker/volumes/volume_name/_data
