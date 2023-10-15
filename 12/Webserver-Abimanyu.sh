echo "<VirtualHost *:80>
    ServerName abimanyu.D06.com
    ServerAlias www.abimanyu.D06.com
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/abimanyu.D06

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
    
    <Directory /var/www/abimanyu.D06/index.php/home>
        Options +Indexes
    </Directory>
    
    Alias \"/home\" \"/var/www/abimanyu.D06/index.php/home\"
</VirtualHost>" >/etc/apache2/sites-available/abimanyu.D06.com.conf
service apache2 restart
