# No 10
echo "
# Default menggunakan Round Robin
upstream webD06  {
	server 192.194.3.2:8001; # IP Abimanyu
	server 192.194.3.3:8002; # IP Prabukusuma
	server 192.194.3.4:8003; # IP Wisanggeni
}

server {
	listen 80;
	server_name arjuna.D06.com www.arjuna.D06.com;
	location / {
    proxy_pass http://webD06;
	}
}
" >/etc/nginx/sites-available/lb-jarkom
ln -s /etc/nginx/sites-available/lb-jarkom /etc/nginx/sites-enabled
service nginx restart
