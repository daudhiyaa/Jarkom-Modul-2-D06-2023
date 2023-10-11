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
@         IN      NS      abimanyu.D06.com.
@         IN      A       192.194.1.3     ; IP DNSMASTER
www       IN      CNAME   abimanyu.D06.com.
parikesit IN      A       192.194.3.2     ; IP Abimanyu
ns1	      IN	    A	      192.194.1.2	    ; IP DNSSLAVE
baratayuda IN	    NS	    ns1
@         IN      AAAA    ::1
" >/etc/bind/jarkom/abimanyu.D06.com

echo "
options {
    directory "/var/cache/bind/";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk. See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable
    // nameservers, you probably want to use the as forwarders.
    // Uncomment the following block, and insert the addresses replacing
    // the all-0's placeholder.

    // forwarders {
    //      0.0.0.0;
    // };  

    //=======================================================================
    // If BIND logs error messages about the root keu being expired,
    // you will need to update your keys. See https://www.isc.org/bind-keys
    //=======================================================================
    //dnssec-validation auto;
    allow-query{any;};

    auth-nxdomain no;    # conform to RFC1035
    listen-on-v6 { any; };
};
" >/etc/bind/named.conf.options

echo "
zone \"abimanyu.D06.com\" {
    type master;
    file \"/etc/bind/jarkom/abimanyu.D06.com\";
    allow-transfer { 192.194.1.2; }; # IP DNSSLAVE
};

zone \"1.194.192.in-addr.arpa\" {
  type master; 
  file \"/etc/bind/jarkom/1.194.192.in-addr.arpa\"; 
};
" >/etc/bind/named.conf.local

service bind9 restart

# No 9
apt-get install nginx -y
