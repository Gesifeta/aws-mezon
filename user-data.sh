#!/bin/bash
# Update the system
yum update -y

# Install nginx
yum install nginx -y

# Start nginx service
systemctl start nginx

# Enable nginx to start on boot
systemctl enable nginx

# Set correct permissions
usermod -a -G nginx ec2-user
chown -R ec2-user:nginx /usr/share/nginx/html

# Allow nginx user to access the content
chmod 2775 /usr/share/nginx/html
find /usr/share/nginx/html -type d -exec chmod 2775 {} \;
find /usr/share/nginx/html -type f -exec chmod 0664 {} \;





#!/bin/bash
# Update the system
apt update
apt upgrade -y

# Install nginx
apt install nginx -y

# Start nginx service
systemctl start nginx

# Enable nginx to start on boot
systemctl enable nginx

# Set correct permissions
usermod -a -G www-data ubuntu
chown -R ubuntu:www-data /var/www/html

# Allow nginx user to access the content
chmod 2775 /var/www/html
find /var/www/html -type d -exec chmod 2775 {} \;
find /var/www/html -type f -exec chmod 0664 {} \;
