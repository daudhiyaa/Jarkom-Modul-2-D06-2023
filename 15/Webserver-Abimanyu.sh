echo -e '
<html
  style="
    background-image: url('nyee.jpg');
    height: 100;
    background-repeat: no-repeat;
    background-size: 100% 100%;
    height: 100%;
    width: 100%;
  "
>
  <header>
    <h1 style="text-align: center; color: white">
      lmao ERROR 403 (Forbidden) BRO dari kelompok D06
    </h1>
  </header>
</html>
' >/var/www/parikesit.abimanyu.D06/error/403.html

echo -e '
<html
  style="
    background-image: url('nyee.jpg');
    height: 100;
    background-repeat: no-repeat;
    background-size: 100% 100%;
    height: 100%;
    width: 100%;
  "
>
  <header>
    <h1 style="text-align: center; color: white">
      lmao ERROR 404 (Not Found) BRO dari kelompok D06
    </h1>
  </header>
</html>
' >/var/www/parikesit.abimanyu.D06/error/404.html

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
</VirtualHost>" >/etc/apache2/sites-available/parikesit.abimanyu.D06.com.conf
service apache2 restart
