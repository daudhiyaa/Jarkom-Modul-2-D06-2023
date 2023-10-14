echo -e '<VirtualHost *:80>
    ServerAdmin webmaster@abimanyu.D06.com
    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    Redirect / http://www.abimanyu.D06.com/
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

apache2ctl configtest
service apache2 restart