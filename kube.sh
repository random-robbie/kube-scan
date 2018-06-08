#!/bin/bash
if [ -z "$1" ]
  then
    echo "No CIDR Supplied"
fi
echo "[*] Scanning CDIR Range $1 [*]"
masscan --rate 10000 -p10250 $1 -oG results.txt
awk '/^Host:/ { print $2 }' results.txt > ip_results.txt
echo "[*] Grabbing Results and Testing Them [*]"
for ip in `cat ip_results.txt`; do
		echo "[*] Testing $ip for Kubernetes [*]"
        	timeout 10s curl -sSLk --connect-timeout 10 https://$ip:10250/pods | jq . > ./cfg/$ip.json
done
cd cfg
find -type f -empty -delete
cd ..
