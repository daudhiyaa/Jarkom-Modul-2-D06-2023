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
  <Directory /var/www/parikesit.abimanyu.D06/error>
    Options -Indexes
  </Directory>
  
  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html
  
  Alias \"/js\" \"/var/www/parikesit.abimanyu.D06/public/js\"
</VirtualHost>" >/etc/apache2/sites-available/parikesit.abimanyu.D06.com.conf
service apache2 restart
