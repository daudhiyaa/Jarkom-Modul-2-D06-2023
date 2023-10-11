# No 5
echo "zone \"3.194.192.in-addr.arpa\" {
  type master; 
  file \"/etc/bind/jarkom/3.194.192.in-addr.arpa\"; 
};" >>/etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/3.194.192.in-addr.arpa

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
3.194.192.in-addr.arpa.  IN      NS      abimanyu.D06.com.
2                        IN      PTR     abimanyu.D06.com.
" >/etc/bind/jarkom/3.194.192.in-addr.arpa
service bind9 restart
