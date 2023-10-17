# No 6
echo "
zone \"abimanyu.D06.com\" {
    type master;
    notify yes;
    also-notify { 192.194.1.2; }; # IP DNSSLAVE
    allow-transfer { 192.194.1.2; }; # IP DNSSLAVE
    file \"/etc/bind/jarkom/abimanyu.D06.com\";
};

zone \"arjuna.D06.com\" { 
  type master; 
  file \"/etc/bind/jarkom/arjuna.D06.com\";
};

zone \"1.194.192.in-addr.arpa\" {
  type master;
  file \"/etc/bind/jarkom/1.194.192.in-addr.arpa\"; 
};
" >/etc/bind/named.conf.local
service bind9 restart

# buat testing dns-slave
# service bind9 stop
