## Version Notation 
(momo version).(WebRTC version).(build version)

## How do they differ from each other? 
 Usually, different build version would mean no more than... 
 1. Different version of [momo](https://github.com/shiguredo/momo) 
 2. Different version of WebRTC library build from [Shiguredo](https://github.com/shiguredo/shiguredo-webrtc-build) 
 3. Different build "parity" : changes that can be made in CMakeLists.txt such as toggling USE_JETSON_ENCODER and so on.

```
sudo ./momo_setup.sh 
enter
Folder => ../

cd ../2021.4.2.M94.0/ubuntu-18.04_armv8_jetson_nano/
./momo --resolution 1920x1080 --framerate 30 --priority FRAMERATE --hw-mjpeg-decoder=true --insecure --no-audio-device ayame --signaling-url wss://ayame-labo.shiguredo.jp/signaling --channel-id road-balance-test

```

# Open url in Chrome 

https://openayame.github.io/ayame-web-sdk-samples/recvonly.html?roomId=road-balance-test


