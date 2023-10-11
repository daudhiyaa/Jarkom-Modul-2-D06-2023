# No 6
# setelah bind9 di DNSMASTER distop
echo "
nameserver 192.194.1.3 # IP DNSMASTER
nameserver 192.194.1.2 # IP DNSSLAVE
" >/etc/resolv.conf
ping abimanyu.D06.com -c 3
