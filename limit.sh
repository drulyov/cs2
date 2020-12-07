iptables -I FORWARD -p tcp -i ens192 --dport 80 -j DROP
iptables -I FORWARD -p tcp -i ens192 --dport 80 -m limit --limit 500/minute --limit-burst 600 -j ACCEPT

iptables -I FORWARD -p tcp -i ens192 --dport 22 -j DROP
iptables -I FORWARD -p tcp -i ens192 --dport 22 -m limit --limit 4/minute --limit-burst 4 -j ACCEPT

iptables -I INPUT -p tcp -i ens192 --dport 22 -j DROP
iptables -I INPUT -p tcp -i ens192 --dport 22 -m limit --limit 4/minute --limit-burst 4 -j ACCEPT

iptables -A FORWARD -j LOG --log-prefix "Traffic Exceeds Limits: " --log-level 4

