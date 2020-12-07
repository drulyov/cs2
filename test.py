from scapy.all import *

source = '192.168.27.5'
dest = '192.168.27.2'
sp = 1200
dp = 80
pl = "exit"

spoofed_packet = IP(src=source, dst=dest) / TCP(sport=sp, dport=dp) / payload

send(spoofed_packet)
