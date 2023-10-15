mkdir /var/www/parikesit.abimanyu.D06/secret
cp /var/www/parikesit.abimanyu.D06/error/403.html /var/www/parikesit.abimanyu.D06/secret/403.html

echo "
<VirtualHost *:80>
  ServerName parikesit.abimanyu.D06.com
  ServerAlias www.parikesit.abimanyu.D06.com
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.D06

  ErrorLog \${APACHE_LOG_DIR}/error.log
  CustomLog \${APACHE_LOG_DIR}/access.log combined
  
  <Directory /var/www/parikesit.abimanyu.D06/public>
    Options +Indexes
  </Directory>
  <Directory /var/www/parikesit.abimanyu.D06/public/js>
    Options -Indexes
  </Directory>
  <Directory /var/www/parikesit.abimanyu.D06/public/css>
    Options -Indexes
  </Directory>
  <Directory /var/www/parikesit.abimanyu.D06/public/images>
    Options -Indexes
  </Directory>
  <Directory /var/www/parikesit.abimanyu.D06/secret>
    Options -Indexes
  </Directory>
</VirtualHost>" >/etc/apache2/sites-available/parikesit.abimanyu.D06.com.conf
service apache2 restart
