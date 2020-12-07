#Rules to prevent IP spoofing
iptables -I INPUT -s 192.168.27.0/24 -i ens192 -j DROP
iptables -I FORWARD -s 192.168.27.0/24 -i ens192 -j DROP

#Rule to prevent external hosts from accessing the logging server
#iptables -I FORWARD -p udp -–dport 514 -j DROP

#Webserver Inbound Rate Limiting
iptables -I FORWARD -p tcp -i ens192 --dport 80 -j DROP
iptables -I FORWARD -p tcp -i ens192 --dport 80 -m limit --limit 500/minute --limit-burst 600 -j ACCEPT

#Webserver Outbound Rate Limiting
iptables -I FORWARD -p tcp -i ens224 --sport 80 -j DROP
iptables -I FORWARD -p tcp -i ens224 --sport 80 -m limit --limit 500/minute --limit-burst 600 -j ACCEPT

#SSH Server Inbound Limiting
iptables -I FORWARD -p tcp -i ens192 --dport 22 -j DROP
iptables -I FORWARD -p tcp -i ens192 --dport 22 -m limit --limit 4/minute --limit-burst 4 -j ACCEPT
iptables -I FORWARD -p tcp --dport 22 -s 172.16.0.1 -j ACCEPT
iptables -I INPUT -p tcp --dport 22 -s 172.16.0.1 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j DROP
iptables -A FORWARD -p tcp --dport 22 -j DROP

#Logging rule for Traffic Which Exceeds Limits
iptables -A FORWARD -j LOG --log-prefix "Traffic Exceeds Limits: " --log-level 4

