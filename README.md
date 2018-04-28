# VPN bypass white-list client side routing

Setup your client VPN and route Russian GOV, ORG services and listed websites traffic without VPN.
It's useful to save VPN traffic and to prevent VPN-usage detection.

This script is mend to setup routing. It doesn't sets up your VPN-client or VPN-server.
See details bellow.

## INSTALATION (Linux, see details bellow for another OS)

```
git clone https://github.com/a2nt/russian-routing.git
cd russian-routing
sudo ./install.sh
```

## Auto launch script on VPN connection

Add following lines to your ovpn-file: 
```
script-security 2
# run /etc/openvpn/routing.sh when the connection is set up
up /etc/openvpn/routing.sh
```

## Automatically start/restart VPN-connection on any network connected (Linux)

Add following lines to /etc/NetworkManager/dispatcher.d/vpn-up:
```
#! /bin/bash

# start VPN connection using Linux NetworkManger CLI
nmcli con up id "<YOUR-VPN-CONNECTION-NAME>"

# start script if it wasn't set inside ovpn-file
/etc/openvpn/routing.sh
```

## USAGE

Add extra domain name (See bellow for details):
```
sudo nano /etc/openvpn/extra.domains.list.txt
```

Relaunch routing.sh
```
sudo /etc/openvpn/routing.sh
```

## ISSUES
There's a list of Russian hosters and providers networks.
We think they doesn't respect privacy so we'd like to by-pass it.

It's very long list, some of them are duplicated, but that's ok.
Just remove it if you need to make the script work faster or your router doesn't support long routing tables.

## TESTING

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

## routing.sh

Routes servers' traffic without VPN
#### Yes, you can use it at the rooted device, but it needs to support: bash, dig and of course VPN-client.  

Must be launched as root after connecting to VPN.

ex:
```
sudo ./routing.sh
```

Use ifconfig to get variables as <GATEWAYIP> (your router IP) and <REGULARINTERFACE> (your network interface name) and set it at the routing.sh
otherwise script will detect it automatically

### You can add extra domains to auto-detect their IPs and route them without VPN
Just add a line to extra.domains.list.txt with desired domain name (don't add www.)
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
or search for networks by ORG: https://bgp.he.net/search?search%5Bsearch%5D=VKONTAKTE&commit=Search

To add routing for a specific IP use following syntax:
sudo nano /etc/openvpn/routing.sh
```
ip route add <RU-SERVER-IP> via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
```

## Extras

You can use https://github.com/Angristan/OpenVPN-install/ to setup your own VPN server.