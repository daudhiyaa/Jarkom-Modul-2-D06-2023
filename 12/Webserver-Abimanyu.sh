echo "
<Directory /var/www/abimanyu.D06/index.php/home>
    Options +Indexes
</Directory>

Alias \"/home\" \"/var/www/abimanyu.D06/index.php/home\"
" >>/etc/apache2/sites-available/abimanyu.D06.com.conf
service apache2 restart
