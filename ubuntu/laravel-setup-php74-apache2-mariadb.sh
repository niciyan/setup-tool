#!/bin/bash
set -ex

# https://linuxopsys.com/topics/install-laravel-on-ubuntu-20-04

sudo apt install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl status apache2

sudo apt install php libapache2-mod-php php-mbstring php-cli php-bcmath php-json php-xml php-zip php-pdo php-common php-tokenizer php-mysql
php -v

sudo apt install mariadb-server
sudo mysql -u root << EOF
CREATE DATABASE laravel_db;
CREATE USER 'laravel_user'@'localhost' IDENTIFIED BY 'secretpassword';
GRANT ALL ON laravel_db.* TO 'laravel_user'@'localhost';
FLUSH PRIVILEGES;
QUIT;
EOF

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
composer --version

cd /var/www/html
sudo composer create-project laravel/laravel laravelapp
sudo chown -R www-data:www-data /var/www/html/laravelapp
sudo chmod -R 775 /var/www/html/laravelapp/storage
cd laravelapp
php artisan

cat << "EOT" > /etc/apache2/sites-available/laravel.conf
<VirtualHost *:80>
ServerName example.com
ServerAdmin admin@example.com
DocumentRoot /var/www/html/laravelapp/public
<Directory /var/www/html/laravelapp>
AllowOverride All
</Directory>
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOT

sudo a2ensite laravel.conf
sudo a2dissite 000-default.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
