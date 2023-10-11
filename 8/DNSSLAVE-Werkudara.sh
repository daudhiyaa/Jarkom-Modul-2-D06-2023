# No 8
echo '
;
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
rjp     IN      A       192.194.3.2       ; IP Abimanyu
www.rjp     IN      CNAME   rjp.baratayuda.abimanyu.D06.com.
@       IN      AAAA    ::1
' >/etc/bind/baratayuda/baratayuda.abimanyu.D06.com

service bind9 restart
