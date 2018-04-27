# russian-routing
Setup your client VPN and route Russian GOV and ORG services traffic without VPN.

## routing.sh

Routes RU-servers traffic without VPN
Must be launched as root after connecting to VPN

ex:
```
sudo ./routing.sh
```

Use ifconfig to get variables as <GATEWAYIP> (your router IP) and <REGULARINTERFACE> (your network interface name) and set it at the routing.sh
otherwise script will detect it automatically

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

Add following lines to your ovpn-file: 
```
script-security 2
# run /etc/openvpn/nat.sh when the connection is set up
up /etc/openvpn/nat.sh
```

## Automatically start/restart VPN-connection on any network connected

add following lines to /etc/NetworkManager/dispatcher.d/vpn-up:
```
#! /bin/bash

# start VPN connection using Linux NetworkManger CLI
nmcli con up id "<YOUR-VPN-CONNECTION-NAME>"

# start script if it wasn't set inside ovpn-file
/etc/openvpn/nat.sh
```

## Extras

You can use https://github.com/Angristan/OpenVPN-install/ to setup your own VPN server.