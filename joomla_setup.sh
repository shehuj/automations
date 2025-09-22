#!/bin/bash
set -euo pipefail

# === Configuration ===
JOOMLA_ZIP_URL="https://github.com/joomla/joomla-cms/releases/download/3.9.28/Joomla_3.9.28-Stable-Full_Package.zip"
WEB_ROOT="/var/www/html"
DIR_CONF="/etc/apache2/mods-enabled/dir.conf"

# === Update & install essentials ===
echo "Updating package list..."
sudo apt update

echo "Installing Apache, PHP, and modules..."
sudo apt install -y apache2 php libapache2-mod-php php-mysql php-xml php-gd unzip

echo "Starting and enabling Apache..."
sudo systemctl start apache2
sudo systemctl enable apache2

# === Download and extract Joomla ===
cd "$WEB_ROOT"
echo "Downloading Joomla..."
sudo curl -L -o joomla.zip "$JOOMLA_ZIP_URL"

echo "Extracting Joomla..."
sudo unzip -o joomla.zip
sudo rm joomla.zip

# === Permissions and cleanup ===
echo "Setting permissions..."
sudo chown -R www-data:www-data "$WEB_ROOT"
sudo chmod -R 755 "$WEB_ROOT"

echo "Removing default Apache index.html..."
sudo rm -f "$WEB_ROOT/index.html"

# === Configure DirectoryIndex priority ===
echo "Configuring DirectoryIndex..."
sudo sed -i 's/DirectoryIndex .*/DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/' "$DIR_CONF"

echo "Restarting Apache..."
sudo systemctl restart apache2
echo "Joomla setup completed. Access your site at http://your_server_ip"