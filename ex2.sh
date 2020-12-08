iptables -A INPUT -p tcp --dport 25 -j ACCEPT

iptables -A INPUT -p udp --sport 53 -j ACCEPT

iptables -A INPUT -p tcp -s 192.168.27.1 --dport 22 -j ACCEPT

iptables -A INPUT -j DROP
