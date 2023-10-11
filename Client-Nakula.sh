# No 2
echo "
# nameserver 192.168.122.1 # IP Pandudewanata
nameserver 192.194.1.3 # IP DNSMASTER
" >/etc/resolv.conf

# No 5
echo "
nameserver 192.168.122.1 # IP Pandudewanata
# nameserver 192.194.1.3 # IP DNSMASTER
" >/etc/resolv.conf

apt-get update
apt-get install dnsutils -y

echo "
# nameserver 192.168.122.1 # IP Pandudewanata
nameserver 192.194.1.3 # IP DNSMASTER
" >/etc/resolv.conf

host -t PTR "192.194.1.3" # IP DNSMASTER

# No 6
echo "
nameserver 192.194.1.3 # IP DNSMASTER
nameserver 192.194.1.2 # IP DNSSLAVE
" >/etc/resolv.conf
ping abimanyu.D06.com -c 3
