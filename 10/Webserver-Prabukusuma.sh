# No 10
echo "
server {
  listen 8002;

  root /var/www/jarkom;

  index index.php index.html index.htm;
  server_name arjuna.D06.com;

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

apt-get update && apt-get install wget && apt-get install unzip

wget --no-check-certificate "https://drive.google.com/uc?export=download&id=17tAM_XDKYWDvF-JJix1x7txvTBEax7vX" -O /var/www/jarkom/arjuna.D06.com.zip

unzip /var/www/jarkom/arjuna.D06.com.zip -d /var/www/jarkom/
mv /var/www/jarkom/arjuna.yyy.com/index.php /var/www/jarkom/

service nginx restart && nginx -t
