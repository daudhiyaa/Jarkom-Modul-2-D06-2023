echo -e '<VirtualHost *:14000 *:14400>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/rjp.baratayuda.abimanyu.D06
  ServerName rjp.baratayuda.abimanyu.D06.com
  ServerAlias www.rjp.baratayuda.abimanyu.D06.com

  <Directory /var/www/rjp.baratayuda.abimanyu.D06>
          AuthType Basic
          AuthName "Restricted Content"
          AuthUserFile /etc/apache2/.htpasswd
          Require valid-user
  </Directory>

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/rjp.baratayuda.abimanyu.D06.com.conf

a2ensite rjp.baratayuda.abimanyu.D06.com.conf
service apache2 restart

htpasswd -c -b /etc/apache2/.htpasswd Wayang baratayudaD06