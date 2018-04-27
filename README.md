# VPN white-list routing
Setup your client VPN and route Russian GOV and ORG services traffic without VPN.
It's useful to save VPN traffic and to prevent VPN-usage detection.

## routing.sh

Routes RU-servers traffic without VPN
Must be launched as root after connecting to VPN

ex:
```
sudo ./routing.sh
```

Use ifconfig to get variables as <GATEWAYIP> (your router IP) and <REGULARINTERFACE> (your network interface name) and set it at the routing.sh
otherwise script will detect it automatically

### You can add extra domains to auto-detect their IPs and route them without VPN
Just add a line to extra.domains.list.txt with your domain name (without www.)
ex:
```
the-village.ru
```

(Don't forget to keep extra.domains.list.txt at the same directory with routing.sh)

### You can add extra server IPs using
```
dig <DOMAIN-NAME>
```
or https://toolbox.googleapps.com/apps/dig/

To add routing for a specific IP use following syntax:
```
ip route add <RU-SERVER-IP> via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
```

### You can test if it was successful using:
```
traceroute <DOMAIN-NAME>
```

#### Result will look this way:
```
1  _gateway (<GATEWAYIP>)  *** ms  *** ms  *** ms
2 *******************************
 ****************
 ```

#### Wrong result will look this way:
```
1  _gateway (<YOUR-VPN-IP>)  *** ms  *** ms  *** ms
2 *******************************
 ****************
```

## Auto launch script on VPN connection
Copy routing.sh and extra.domains.list.txt to /etc/openvpn/

Add following lines to your ovpn-file: 
```
script-security 2
# run /etc/openvpn/routing.sh when the connection is set up
up /etc/openvpn/routing.sh
```

## Automatically start/restart VPN-connection on any network connected
Copy routing.sh and extra.domains.list.txt to /etc/openvpn/

Add following lines to /etc/NetworkManager/dispatcher.d/vpn-up:
```
#! /bin/bash

# start VPN connection using Linux NetworkManger CLI
nmcli con up id "<YOUR-VPN-CONNECTION-NAME>"

# start script if it wasn't set inside ovpn-file
/etc/openvpn/routing.sh
```

## Extras

You can use https://github.com/Angristan/OpenVPN-install/ to setup your own VPN server.