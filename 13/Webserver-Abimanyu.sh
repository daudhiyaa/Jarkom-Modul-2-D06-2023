echo "
<VirtualHost *:80>
  ServerName parikesit.abimanyu.D06.com
  ServerAlias www.parikesit.abimanyu.D06.com
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.D06

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" >/etc/apache2/sites-available/parikesit.abimanyu.D06.com.conf

a2ensite parikesit.abimanyu.D06.com.conf
service apache2 reload
service apache2 restart
