mkdir /var/www/parikesit.abimanyu.D06/secret
cp /var/www/parikesit.abimanyu.D06/error/403.html /var/www/parikesit.abimanyu.D06/secret/403.html

echo "
<Directory /var/www/parikesit.abimanyu.D06/public>
  Options +Indexes
</Directory>
<Directory /var/www/parikesit.abimanyu.D06/secret>
  Options -Indexes
</Directory>
" >>/etc/apache2/sites-available/parikesit.abimanyu.D06.com.conf
