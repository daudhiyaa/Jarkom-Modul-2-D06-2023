mkdir /var/www/parikesit.abimanyu.D06

echo "
<VirtualHost *:80>
  ServerName parikesit.abimanyu.D06.com
  # ServerAlias www.parikesit.abimanyu.D06.com
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.D06

  ErrorLog \${APACHE_LOG_DIR}/error.log
  CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" >/etc/apache2/sites-available/parikesit.abimanyu.D06.com.conf

wget --no-check-certificate "https://drive.google.com/uc?export=download&id=1LdbYntiYVF_NVNgJis1GLCLPEGyIOreS" -O /var/www/parikesit.abimanyu.D06/parikesit.abimanyu.D06.com.zip

unzip /var/www/parikesit.abimanyu.D06/parikesit.abimanyu.D06.com.zip -d /var/www/parikesit.abimanyu.D06/

mv /var/www/parikesit.abimanyu.D06/parikesit.abimanyu.yyy.com/error /var/www/parikesit.abimanyu.D06/
mv /var/www/parikesit.abimanyu.D06/parikesit.abimanyu.yyy.com/public /var/www/parikesit.abimanyu.D06/

a2ensite parikesit.abimanyu.D06.com.conf
service apache2 reload
service apache2 restart
