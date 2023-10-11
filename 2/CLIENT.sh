echo nameserver 192.168.122.1 >/etc/resolv.conf

# No 2
echo "
# nameserver 192.168.122.1 # IP Pandudewanata
nameserver 192.194.1.3 # IP DNSMASTER
" >/etc/resolv.conf

ping arjuna.D06.com -c 5
ping www.arjuna.D06.com -c 5
