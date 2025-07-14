#!/bin/bash

# Create Directories
mkdir Development
mkdir Operations
mkdir Analytics

# Create Dummy files
touch Development/dummy1 Development/dummy2 Development/dummy3
touch Operations/dummy1 Operations/dummy2 Operations/dummy3
touch Analytics/dummy1 Analytics/dummy2 Analytics/dummy3

# Create Groups
groupadd Developers
groupadd Operations
groupadd Data_Analysts

# Modify Ownerships and permissions
chown :Developers Development
chown :Operations Operations
chown :Data_Analysts Analytics

chmod 770 Development
chmod 770 Operations
chmod 770 Analytics

# Create Users and seamlessly add them to their respective groups
useradd -m -s /bin/bash -G Developers jwaller
useradd -m -s /bin/bash -G Operations bdorsey
useradd -m -s /bin/bash -G Data_Analysts jewart

# Modify user Password
echo “jwaller:Developers1” | chpasswd
echo “jwaller:Operations1” | chpasswd
echo “jwaller:Analytics1” | chpasswd

# Set Permissions for user profiles
chmod 700 /home/jwaller
chmod 700 /home/bdorsey
chmod 700 /home/jewart

echo “set up successful ! Q.E.D”
