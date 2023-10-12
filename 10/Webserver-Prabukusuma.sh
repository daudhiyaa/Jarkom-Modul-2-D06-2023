# No 10
echo "
server {
  listen 8002;

  root /var/www/jarkom;

  index index.php index.html index.htm;
  server_name _;

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

rm /etc/nginx/sites-enabled/default
service nginx restart && nginx -t
