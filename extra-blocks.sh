ip route add  104.20.150.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
ip route add  104.20.151.0/24 via $GATEWAYIP dev $REGULARINTERFACE proto static metric 600
