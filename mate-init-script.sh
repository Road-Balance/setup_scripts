#!/bin/bash

SCIPRTPATH=$(dirname "$(readlink -f "$0")")

case "$1" in
    restart)
        sed -i "/^${SCRIPTPATH}/mate-init-script.sh restart/d" /home/${USER}/.bashrc
	    sudo apt-get update && sudo apt-get upgrade -y
	    sudo apt-get install ubuntu-mate-desktop
        ;;
    *)
        echo -e "\n${SCRIPTPATH}/mate-init-script.sh restart" >> /home/${USER}/.bashrc
        if [ $(ls /sys/class/net | grep wlan0) == "wlan0" ]; then
            echo "SSID?" && read SSID
            echo "PW?" && read PW
            sudo echo -e "\n    wifis:\
                          \n        wlan0:\
                          \n            optional: true\
                          \n            access-points:\
                          \n                \"${SSID}\":\
                          \n                        password: \"${PW}\"\
                          \n            dhcp4: true" >> /etc/netplan/50-cloud-init.yaml
            echo "Now rebooting..." && sleep 2s
            sudo reboot    
        else 
            echo "No Wi-Fi class found... Please make sure your RPi support Wi-Fi connection..."
        fi
        ;;
esac
