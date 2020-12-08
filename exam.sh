iptables -I FORWARD -p udp -d 192.168.27.2 --dport 53 -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -I FORWARD -p tcp -d 192.168.27.3 --dport 25 -m state --state NEW -m recent --set
iptables -I FORWARD -p tcp -d 192.168.27.3 --dport 25 -m state --state NEW -m recent --update --seconds 30 --hitcount 2 -j DROP
iptables -A FORWARD -d 192.168.27.2 -j DROP

iptables -A FORWARD -d 192.168.27.3 -j DROP

