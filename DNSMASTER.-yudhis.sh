echo nameserver 192.168.122.1 >/etc/resolv.conf

# No 2
apt-get update
apt-get install bind9 -y

echo "zone \"arjuna.D06.com\" { 
  type master; 
  file \"/etc/bind/jarkom/arjuna.D06.com\";
};" >/etc/bind/named.conf.local

mkdir /etc/bind/jarkom
cp /etc/bind/db.local /etc/bind/jarkom/arjuna.D06.com

echo "
;
; BIND data file for local loopback interface
;
\$TTL   604800
@       IN      SOA     arjuna.D06.com. root.arjuna.D06.com. (
                        2023100101      ; Serial
                            604800      ; Refresh
                             86400      ; Retry
                           2419200      ; Expire
                            604800 )    ; Negative Cache TTL
;
@       IN      NS      arjuna.D06.com.
@       IN      A       192.194.3.5     ; IP LB-ARJUNA
www     IN      CNAME   arjuna.D06.com.
@       IN      AAAA    ::1
" >/etc/bind/jarkom/arjuna.D06.com
service bind9 restart

# No 3
echo "zone \"abimanyu.D06.com\" { 
  type master; 
  file \"/etc/bind/jarkom/abimanyu.D06.com\"; 
};" >/etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.D06.com

echo "
;
; BIND data file for local loopback interface
;
\$TTL   604800
@       IN      SOA     abimanyu.D06.com. root.abimanyu.D06.com. (
                        2023100101      ; Serial
                            604800      ; Refresh
                             86400      ; Retry
                           2419200      ; Expire
                            604800 )    ; Negative Cache TTL
;
@       IN      NS      abimanyu.D06.com.
@       IN      A       192.194.3.2     ; IP Abimanyu
www     IN      CNAME   abimanyu.D06.com.
@       IN      AAAA    ::1
" >/etc/bind/jarkom/abimanyu.D06.com
service bind9 restart

# No 4
echo "
;
; BIND data file for local loopback interface
;
\$TTL   604800
@       IN      SOA     abimanyu.D06.com. root.abimanyu.D06.com. (
                        2023100101      ; Serial
                            604800      ; Refresh
                             86400      ; Retry
                           2419200      ; Expire
                            604800 )    ; Negative Cache TTL
;
@       IN      NS      abimanyu.D06.com.
@       IN      A       192.194.3.2     ; IP Abimanyu
www     IN      CNAME   abimanyu.D06.com.
parikesit IN    A       192.194.3.2     ; IP Abimanyu
@       IN      AAAA    ::1
" >/etc/bind/jarkom/abimanyu.D06.com
service bind9 restart

# No 5
echo "zone \"1.194.192.in-addr.arpa\" {
  type master; 
  file \"/etc/bind/jarkom/1.194.192.in-addr.arpa\"; 
};" >>/etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/1.194.192.in-addr.arpa

echo "
;
; BIND data file for local loopback interface
;
\$TTL   604800
@       IN      SOA     abimanyu.D06.com. root.abimanyu.D06.com. (
                        2023100101      ; Serial
                            604800      ; Refresh
                             86400      ; Retry
                           2419200      ; Expire
                            604800 )    ; Negative Cache TTL
;
1.194.192.in-addr.arpa.  IN      NS      abimanyu.D06.com.
3                        IN      PTR     abimanyu.D06.com.
" >/etc/bind/jarkom/1.194.192.in-addr.arpa
service bind9 restart

# No 6
nano /etc/bind/named.conf.local
echo "
zone \"abimanyu.D06.com\" {
    type master;
    notify yes;
    also-notify { 192.194.1.2; }; # IP DNSSLAVE
    allow-transfer { 192.194.1.2; }; # IP DNSSLAVE
    file \"/etc/bind/jarkom/abimanyu.D06.com\";
};

zone \"1.194.192.in-addr.arpa\" {
  type master; 
  file \"/etc/bind/jarkom/1.194.192.in-addr.arpa\"; 
};
" >/etc/bind/named.conf.local
service bind9 restart

# buat testing dns-slave
service bind9 stop

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

# No 9
apt-get install nginx -y
