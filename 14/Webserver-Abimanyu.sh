echo "
<Directory /var/www/parikesit.abimanyu.D06/public>
  Options +Indexes
</Directory>
<Directory /var/www/parikesit.abimanyu.D06/error>
  Options -Indexes
</Directory>
" >>/etc/apache2/sites-available/parikesit.abimanyu.D06.com.conf
