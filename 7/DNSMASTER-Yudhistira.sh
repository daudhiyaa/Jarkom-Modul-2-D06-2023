# No 7
echo ";
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.D06.com. root.abimanyu.D06.com. (
                     2023100101         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.D06.com.
@       IN      A       192.194.3.2       ; IP Abimanyu
www     IN      CNAME   abimanyu.D06.com.
parikesit  IN   A       192.194.3.2       ; IP Abimanyu
ns1     IN      A       192.194.1.3       ; IP DNSMASTER
baratayuda IN   NS      ns1
@       IN      AAAA    ::1
" >/etc/bind/jarkom/abimanyu.D06.com

echo 'options {
  directory "/var/cache/bind";
  allow-query{any;};
  auth-nxdomain no;    # conform to RFC1035
  listen-on-v6 { any; };
};' >/etc/bind/named.conf.options

service bind9 restart
