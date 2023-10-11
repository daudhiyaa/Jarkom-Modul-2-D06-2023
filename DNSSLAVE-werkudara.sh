# No 6
apt-get update
apt-get install bind9 -y
echo "
zone \"abimanyu.D06.com\" {
    type slave;
    masters { 192.194.1.3; }; # IP DNSMASTER
    file \"/var/lib/bind/abimanyu.D06.com\";
};" >/etc/bind/named.conf.local
service bind9 restart
