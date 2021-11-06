#!/bin/bash

pwd=$PWD

if [ ! -d "/home/$USER/.vim" ]; then
	if [ $(vim --version | grep -oP '(?<=IMproved )[^ ]?') -lt 6 ]; then
		echo "Requires VIM version >= 6.0. Aborting."
		exit
	else 
		mkdir /home/$USER/.vim
	fi
fi

[ ! -d "/home/$USER/.vim/plugin" ] && mkdir /home/$USER/.vim/plugin		
cd /home/$USER/.vim/plugin

[ -f "/home/$USER/.vim/plugin/cscope_maps.vim" ] && echo -e "cscope_maps.vim already exists! Removing...\n" && rm cscope_maps.vim

echo -e "Fetching cscope_maps.vim to your VIM plugin dir.\n"
wget "http://cscope.sourceforge.net/cscope_maps.vim"

echo "Done."
cd $PWD
