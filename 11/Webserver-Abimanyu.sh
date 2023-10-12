apt-get install apache2 -y
apache2 -v
service apache2 start

apt-get install php -y
php -v

apt-get install libapache2-mod-php7.0 -y

mkdir /var/www/abimanyu.D06

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/abimanyu.D06.com.conf
rm /etc/apache2/sites-available/000-default.conf

echo "<VirtualHost *:80>
  ServerName abimanyu.D06.com
  ServerAlias www.abimanyu.D06.com
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/abimanyu.D06

  ErrorLog \${APACHE_LOG_DIR}/error.log
  CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" >/etc/apache2/sites-available/abimanyu.D06.com.conf

wget --no-check-certificate "https://drive.google.com/uc?export=download&id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc" -O /var/www/abimanyu.D06/abimanyu.D06.com.zip

unzip /var/www/abimanyu.D06/abimanyu.D06.com.zip -d /var/www/abimanyu.D06/

mv /var/www/abimanyu.D06/abimanyu.yyy.com/home.html /var/www/abimanyu.D06/
mv /var/www/abimanyu.D06/abimanyu.yyy.com/abimanyu.webp /var/www/abimanyu.D06/
mv /var/www/abimanyu.D06/abimanyu.yyy.com/index.php /var/www/abimanyu.D06/

a2ensite abimanyu.D06.com.conf
service apache2 reload
service apache2 restart
