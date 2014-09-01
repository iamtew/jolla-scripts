#! /usr/bin/env bash
# -*- mode: shell; tab-width: 2; sublime-rulers: [100]; -*-
# vim: tabstop=2 cc=100

# This will set the CPU governor to "performance" to improve performance of the Jolla
#
# Information gathered from:
#   http://www.jollausers.com/2014/05/want-a-snappier-jolla-you-have-one-line-of-command-to-enter/

script="$BASH_SOURCE"

main () {
	echo "performance" > /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/pwrscale/trustzone/governor
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
