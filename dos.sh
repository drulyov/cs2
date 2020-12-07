echo "Enter the destination IP"
read dest

echo "Enter the destination Port"
read port

echo "Enter the number of packets you want to send"
read numpack

declare -i i=1

while [ $i -le $numpack ]

	do
		echo exit | nc $dest $port
		i=$[$i+1]
	done

