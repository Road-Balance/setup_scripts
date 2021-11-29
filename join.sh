#!/bin/bash

pwd=$PWD

echo -e "\n\x1b[36m\x1b[1mayame-web-sdk-samples가 위치한 디렉토리:\x1b[0m\n"
read TD && cd "${TD/#~/$HOME}"

cd ayame-web-sdk-samples

echo -e "\n\x1b[36m\x1b[1mJoin 하려는 Room ID:\x1b[0m\n"
read RID

sed -i 's/ayame-web-sdk-sample/${RID}/' ./main.js
yarn serve

