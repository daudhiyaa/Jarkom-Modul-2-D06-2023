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

# No 7
echo 'options {
        directory "/var/cache/bind";
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

mkdir /etc/bind/baratayuda
cp /etc/bind/db.local /etc/bind/baratayuda/baratayuda.abimanyu.D06.com

echo 'zone "abimanyu.D06.com" {
    type slave;
    masters { 192.194.1.3; }; // Masukan IP DNS Master
    file "/var/lib/bind/abimanyu.D06.com";
};
zone "baratayuda.abimanyu.D06.com" {
    type master;
    file "/etc/bind/baratayuda/baratayuda.abimanyu.D06.com";
};' > /etc/bind/named.conf.local

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.D06.com. root.baratayuda.abimanyu.D06.com. (
                     2023100101         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      baratayuda.abimanyu.D06.com.
@       IN      A       192.194.1.2       ; IP DNSSLAVE
www     IN      CNAME   baratayuda.abimanyu.D06.com.
@       IN      AAAA    ::1' > /etc/bind/baratayuda/baratayuda.abimanyu.D06.com

service bind9 restart

# No 8
mkdir /etc/bind/jarkom 
cp /etc/bind/db.local /etc/bind/jarkom/rjp.baratayuda.abimanyu.D06.com

echo "
;
; BIND data file for local loopback interface
;
\$TTL   604800
@       IN      SOA     rjp.baratayuda.abimanyu.D06.com. root.rjp.baratayuda.abimanyu.D06.com. (
                        2023100101      ; Serial
                            604800      ; Refresh
                             86400      ; Retry
                           2419200      ; Expire
                            604800 )    ; Negative Cache TTL
;
@       IN      NS      rjp.baratayuda.abimanyu.D06.com
@       IN      A       192.194.1.2     ; IP DNSSLAVE
www     IN      CNAME   rjp.baratayuda.abimanyu.D06.com
@       IN      AAAA    ::1
" >/etc/bind/delegasi/baratayuda.abimanyu.D06.com

service bind9 restart
