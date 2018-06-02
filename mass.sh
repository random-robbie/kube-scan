#!/bin/bash
for ip in `cat $1.txt`; do
        sudo ./kube.sh $ip
done
