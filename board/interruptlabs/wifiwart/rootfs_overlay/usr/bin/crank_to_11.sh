#!/bin/sh

echo "Enter Host password for ssh"
read pw

echo "But this one goes to 11."

# But this one goes to 11
head -c 50000000 </dev/urandom > randomshit # Make a 50Mb file

# Connect to wifi
# wpa_supplicant -c /etc/wpa_supplicant.conf -i wlan0 &>/dev/null & 
# wpa_supplicant -c /etc/wpa_supplicant.conf -i wlan1 &>/dev/null & 

memtester 1000000 1 &>/dev/null &
sshpass -p $pw scp –o BindAddress=10.0.0.169 randomshit machinehum@10.0.0.65:/home/machinehum/pl1/ &>/dev/null &
sshpass -p $pw scp –o BindAddress=10.0.0.114 randomshit machinehum@10.0.0.65:/home/machinehum/pl2/ &>/dev/null &
stress -c 4 &>/dev/null &
stress -d 1 &>/dev/null &

echo "Should be up to 11."
