a2enmod rewrite

echo 'RewriteEngine On
RewriteCond %{REQUEST_URI} ^/public/images/(.*)(abimanyu)(.*\.(png|jpg))
RewriteCond %{REQUEST_URI} !/public/images/abimanyu.png
RewriteRule abimanyu http://parikesit.abimanyu.D06.com/public/images/abimanyu.png$1 [L,R=301]' > /var/www/parikesit.abimanyu.D06/.htaccess

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.D06

  ServerName parikesit.abimanyu.D06.com
  ServerAlias www.parikesit.abimanyu.D06.com

  <Directory /var/www/parikesit.abimanyu.D06/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.D06/secret>
          Options -Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.D06>
          Options +FollowSymLinks -Multiviews
          AllowOverride All
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.D06/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.D06/secret"
  Alias "/js" "/var/www/parikesit.abimanyu.D06/public/js"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.D06.com.conf

service apache2 restart