echo nameserver 192.168.122.1 >/etc/resolv.conf

# No 9
apt-get update
apt-get install bind9 nginx -y

echo "
# Default menggunakan Round Robin
upstream webD06  {
	server 192.194.3.2; # IP Abimanyu
	server 192.194.3.3; # IP Prabukusuma
	server 192.194.3.4; # IP Wisanggeni
}

server {
	listen 80;
	server_name abimanyu.D06.com;
	location / {
    proxy_pass http://webD06;
	}
}
" >/etc/nginx/sites-available/lb-jarkom
ln -s /etc/nginx/sites-available/lb-jarkom /etc/nginx/sites-enabled
