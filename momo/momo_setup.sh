#!/bin/bash

pwd=$PWD

echo -e "\n\x1b[36m\x1b[1mmomo를 설치할 디렉토리를 입력해주세요:\x1b[0m"
read MOMOD && sleep 1s
if [ ! -d "${MOMOD/#~/$HOME}/momo_prebuilt" ]; then
	cd "${MOMOD/#~/$HOME}"
	git clone https://github.com/mt-chilgab/momo_prebuilt.git
fi
cd $pwd

if [ -z "$(whereis go | grep -oP '(?<=: ).*[^ ]')" ] || [ $(go version | grep -oP '(?<=go1.).?[^.]') -lt 15 ]
then
	echo -e "\n\x1b[36m\x1b[1msnap 및 go(>=1.15)를 설치합니다.\x1b[0m\n"
	read -n 1 -s -r -p "아무 키나 눌러 계속하세요"
	
	[[ -z "$(whereis snap | grep -oP '(?<=: ).*[^ ]')" ]] && sudo apt-get -y install snap
	sudo snap install --classic go
fi

if [ -z "$(whereis node | grep -oP '(?<=: ).*[^ ]')" ]; then
	
	echo -e "\n\x1b[36m\x1b[1mnode.js를 /opt에 설치합니다.\x1b[0m\n"
	read -n 1 -s -r -p "아무 키나 눌러 계속하세요"
	
	wget "https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-arm64.tar.xz"
	tar xvf node-v16.13.0-linux-arm64.tar.xz && rm node-v16.13.0-linux-arm64.tar.xz
	sudo mv node-v16.13.0-linux-arm64 /opt
	cd /usr/local/bin && sudo ln -s /opt/node-v16.13.0-linux-arm64/bin/* ./
	cd $pwd
fi

if [ -z "$(whereis yarn | grep -oP '(?<=: ).*[^ ]')" ]; then
	
	echo -e "\n\x1b[36m\x1b[1myarn을 설치합니다.\x1b[0m\n"
	read -n 1 -s -r -p "아무 키나 눌러 계속하세요"

	[[ -z "$(whereis curl | grep -oP '(?<=: ).*[^ ]')" ]] && sudo apt-get -y install curl
	
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

	sudo apt-get update && sudo apt-get -y install yarn
fi

echo -e "\n\x1b[36m\x1b[1mayame 및 ayame-web-sdk-sample을 설치할 디렉토리를 입력해주세요:\x1b[0m"
read TD && sleep 1s
if [ ! -d "${TD/#~/$HOME}/ayame" ]; then
	cd "${TD/#~/$HOME}"
	git clone http://github.com/OpenAyame/ayame
fi

if [ ! -d "${TD/#~/$HOME}/ayame-web-sdk-samples" ]; then
	cd "${TD/#~/$HOME}"
	git clone http://github.com/OpenAyame/ayame-web-sdk-samples
fi

cd ayame
make && make init

cd ayame-web-sdk-samples
yarn install

cd $pwd
echo -e "\n\x1b[36m\x1b[1m완료.\x1b[0m\n"
