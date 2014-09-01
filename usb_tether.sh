#! /usr/bin/env bash
# -*- mode: shell; tab-width: 2; sublime-rulers: [100]; -*-
# vim: tabstop=2 cc=100

# Set up IP forwarding and iptables rules to route traffic over the RNDIS interface. After this is
# setup you need to add the default gateway to point to the Jolla. On Linux something like this
# will suffice:
#   sudo ip route add default via <Jolla IP> dev <Jolla NIC device>
#
# Information gathered from
#   http://elinux.org/Jolla#How_do_I_enable_USB_tethering.3F

script="$BASH_SOURCE"

main ()
{
	echo "Setting up forwarding and iptables rules"
	echo 1 > /proc/sys/net/ipv4/ip_forward
	/sbin/iptables -t nat -A POSTROUTING -o rmnet0 -j MASQUERADE
	/sbin/iptables -A FORWARD -i rmnet0 -o rndis0 -m state --state RELATED,ESTABLISHED -j ACCEPT
	/sbin/iptables -A FORWARD -i rndis0 -o rmnet0 -j ACCEPT
}

case "$(id -u)" in
	0)
		main
		;;
	*)
		echo "Running as non-privileged user, trying through sudo"
		sudo "$script"
		;;
esac

exit 0
