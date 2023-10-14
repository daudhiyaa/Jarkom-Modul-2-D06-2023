mkdir /var/www/rjp.baratayuda.abimanyu.D06

echo -e '<VirtualHost *:14000 *:14400>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/rjp.baratayuda.abimanyu.D06
  ServerName rjp.baratayuda.abimanyu.D06.com
  ServerAlias www.rjp.baratayuda.abimanyu.D06.com

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/rjp.baratayuda.abimanyu.D06.com.conf

echo -e '# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 14000
Listen 14400

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet' > /etc/apache2/ports.conf

wget --no-check-certificate "https://drive.google.com/uc?export=download&id=1pPSP7yIR05JhSFG67RVzgkb-VcW9vQO6" -O /var/www/rjp.baratayuda.abimanyu.D06/rjp.baratayuda.abimanyu.D06.com.zip

unzip /var/www/rjp.baratayuda.abimanyu.D06/rjp.baratayuda.abimanyu.D06.com.zip -d /var/www/rjp.baratayuda.abimanyu.D06/

mv /var/www/rjp.baratayuda.abimanyu.D06/rjp.baratayuda.abimanyu.yyy.com/anya-bond.webp /var/www/rjp.baratayuda.abimanyu.D06/
mv /var/www/rjp.baratayuda.abimanyu.D06/rjp.baratayuda.abimanyu.yyy.com/loid.png /var/www/rjp.baratayuda.abimanyu.D06/
mv /var/www/rjp.baratayuda.abimanyu.D06/rjp.baratayuda.abimanyu.yyy.com/waku.mp3 /var/www/rjp.baratayuda.abimanyu.D06/
mv /var/www/rjp.baratayuda.abimanyu.D06/rjp.baratayuda.abimanyu.yyy.com/yor.jpg /var/www/rjp.baratayuda.abimanyu.D06/

rm -r /var/www/rjp.baratayuda.abimanyu.D06/rjp.baratayuda.abimanyu.D06.com.zip
rm -r /var/www/rjp.baratayuda.abimanyu.D06/rjp.baratayuda.abimanyu.yyy.com/

a2ensite rjp.baratayuda.abimanyu.D06.com.conf
service apache2 restart