#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2
echo "<h1> WELCOME TO LUIT - THIS IS RED TEAM! </h1>" > /var/www/html/index.html