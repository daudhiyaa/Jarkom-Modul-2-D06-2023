echo nameserver 192.168.122.1 >/etc/resolv.conf

# No 9
apt-get update && apt install nginx php php-fpm -y
service nginx start
service php7.0-fpm start

mkdir /var/www/jarkom
echo "
<?php
echo \"Halo, Kamu berada di Abimanyu\";
?>
" >/var/www/jarkom/index.php

echo "
server {
  listen 80;

  root /var/www/jarkom;

  index index.php index.html index.htm;
  server_name abimanyu.D06.com;

  location / {
    try_files \$uri \$uri/ /index.php?\$query_string;
  }

  # pass PHP scripts to FastCGI server
  location ~ \.php$ {
  include snippets/fastcgi-php.conf;
  fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
  }

  location ~ /\.ht {
    deny all;
  }

  error_log /var/log/nginx/jarkom_error.log;
  access_log /var/log/nginx/jarkom_access.log;
}
" >/etc/nginx/sites-available/jarkom

ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled
service nginx restart
nginx -t
