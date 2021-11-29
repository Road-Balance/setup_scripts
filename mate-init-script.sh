#!/bin/bash

echo -e "export SCRIPTPATH=$(dirname "$(readlink -f "$0")")" >> /home/$USER/.bashrc
source /home/$USER/.bashrc

case "$1" in
    restart)
        sed -i "\~"$SCRIPTPATH"~d" /home/$USER/.bashrc
	sed -i "/^export SCRIPTPATH=/d" /home/$USER/.bashrc
	source /home/$USER/.bashrc
	
	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt-get -y install ubuntu-mate-desktop
	echo "Now rebooting..." && sleep 2s
	sudo reboot

        ;;
    *)
        echo -e "$SCRIPTPATH/mate-init-script.sh restart" >> /home/$USER/.bashrc
	source /home/$USER/.bashrc

        if [ $(ls /sys/class/net | grep wlan0) == "wlan0" ]; then
            echo "SSID?" && read SSID
            echo "PW?" && read PW
            sudo echo -e "    wifis:\
                          \n        wlan0:\
                          \n            optional: true\
                          \n            access-points:\
                          \n                \"${SSID}\":\
                          \n                        password: \"${PW}\"\
                          \n            dhcp4: true" >> /home/$USER/Desktop/sibal
            echo "Now rebooting..." && sleep 2s
            sudo reboot    
        else 
            echo "No Wi-Fi class found... Please make sure your RPi support Wi-Fi connection..."
        fi
        ;;
esac
