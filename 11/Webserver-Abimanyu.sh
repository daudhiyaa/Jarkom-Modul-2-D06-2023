apt-get install apache2 -y
apache2 -v
service apache2 start

apt-get install php -y
php -v

mkdir /var/www/abimanyu.D06
echo "
<?php
echo \"Halo, Kamu berada di Apache Abimanyu\";
?>
" >/var/www/abimanyu.D06/index.php

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/abimanyu.D06.com.conf
rm /etc/apache2/sites-available/000-default.conf

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/abimanyu.D06

  ServerName abimanyu.D06.com
  ServerAlias www.abimanyu.D06.com

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' >/etc/apache2/sites-available/abimanyu.D06.com.conf

a2ensite abimanyu.D06.com.conf
service apache2 reload
service apache2 restart
