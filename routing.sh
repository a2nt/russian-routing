#!/bin/bash

#########################################################################################################
# Routes RU-servers traffic without VPN
# Must be launched as root after connecting to VPN
# sudo ./routing.sh
#
# Use ifconfig to get details as 
# <GATEWAYIP> and <REGULARINTERFACE>
# otherwise script will detect it automatically
#
#
# Use dig <DOMAIN-NAME> to get Russian server IPs
#
# Syntax:
# ip route add <RU-SERVER-IP> via <YOUR-REGULAR-GATEWAY-IP> dev <DEVICE-NAME> proto static metric 600
#
# You can test it using:
# traceroute <DOMAIN-NAME>
# it will return:
# 1  _gateway (<GATEWAY-IP>)  *** ms  *** ms  *** ms
# 2 *******************************
# ****************
#########################################################################################################

#################################################################################
# Preset your variables otherwise it will be auto-detected 

GATEWAYIP="" # Your regular gateway IP (router IP)
REGULARINTERFACE="" # Your regular network interface (ex. eth0)

#################################################################################

DOMAINLIST="./extra.domains.list.txt" # Extra domains you'd like to use without VPN

echo "OpenVPN is connected. Setting up routes ..."

# Detects your regular gateway IP if it wasn't specified 
if [ "$GATEWAYIP" = "" ]; then
  GATEWAYIP=$(route -n | grep 'UG[ \t]' | awk '{print $2}'| sed -n 2p)
fi

# Detects your regular network interface if it wasn't specified
if [ "$REGULARINTERFACE" = "" ]; then
  REGULARINTERFACE=$(route -n | grep 'UG[ \t]' | awk '{print $8}'| sed -n 2p)
fi

echo -e "\n======================================================================\n"
echo "Your regular Gateway: " $REGULARINTERFACE "/" $GATEWAYIP
echo -e "\n======================================================================\n"

# Directs listed IPs using regular gateway
# search for networks by ORG: https://bgp.he.net/search?search%5Bsearch%5D=VKONTAKTE&commit=Search
# or using dig: https://toolbox.googleapps.com/apps/dig/

# VK.com
ip route add 87.240.0.0/16 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 87.240.128.0/18 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 93.186.224.0/21 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 93.186.232.0/21 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.213.0.0/18 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.142.207.0/24	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.142.206.0/24	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.142.204.0/23	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.142.203.0/24	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.142.202.0/24	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.142.201.0/24	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.142.192.0/21	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.142.192.0/20	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 185.32.251.0/24	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 185.32.250.0/24	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 185.32.248.0/23	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 185.32.248.0/22	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 185.29.130.0/24	via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

# odnoklassniki.ru
ip route add 62.105.149.64/26 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 81.176.227.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 81.177.30.0/25 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 81.177.140.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 81.177.143.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 81.177.156.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 89.111.19.141 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 89.249.18.249 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 109.238.244.96/27 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 195.68.188.128/25 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 195.218.169.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 195.222.187.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 195.239.106.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 212.44.139.64/26 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 213.33.198.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 213.221.7.64/26 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 217.20.144.0/20 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 217.106.230.128/26 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

# mail.ru
ip route add 5.61.16.0/21 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 5.61.232.0/21 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 79.137.157.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 79.137.174.0/23 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 79.137.183.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 94.100.176.0/20 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.163.32.0/19 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.163.212.0/22 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.163.216.0/22 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 95.163.248.0/21 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 128.140.168.0/21 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 178.22.88.0/21 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 178.237.16.0/20 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 178.237.29.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 185.5.136.0/22 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 185.6.244.0/22 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 185.16.148.0/22 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 185.16.244.0/22 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

ip route add 188.93.56.0/21 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 194.186.63.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 195.211.20.0/22 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 195.211.128.0/22 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 195.218.168.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 195.218.190.0/23 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 208.87.93.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 208.87.94.0/23 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 217.20.144.0/20 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 217.69.128.0/20 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

ip route add 94.100.180.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 217.69.139.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 185.30.176.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

# yandex.ru
ip route add 5.255.255.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 77.88.55.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

# smtp.yandex.com
ip route add 213.180.193.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 77.88.21.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 93.158.134.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 87.250.250.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

# imap.yandex.com
ip route add 213.180.204.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 87.250.251.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 93.158.134.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

# lenta.ru
ip route add 81.19.72.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

# rambler.ru
ip route add 91.192.148.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 91.192.149.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 81.19.82.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 81.19.73.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add 81.19.83.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

# rambler.com
ip route add 50.63.202.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

# reg.ru
ip route add 194.58.116.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600

echo -e "\n======================================================================\n"
echo "Forwarding extra domains without VPN"
echo -e "\n======================================================================\n"

cat "$DOMAINLIST" | while read DOMAIN
do
	IPS=$(dig "$DOMAIN" www.$DOMAIN | awk '{print $5}' | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sed -r 's/\.[0-9]{1,3}$/.0\/24/')

	echo -e "+++ $DOMAIN +++\n$IPS"

	if [ "$IPS" != "" ]; then
		while read -r WIP
		do
			if [ "$WIP" != "" ]; then
				ip route add "$WIP" via "$GATEWAYIP" dev "$REGULARINTERFACE" proto static metric 700
			fi
		done < <(printf '%s\n' "$IPS")
	fi

	echo -e "\n+++++++++++++++++++++++++++++++++++++++\n"
done

echo "========================= DONE! ========================="