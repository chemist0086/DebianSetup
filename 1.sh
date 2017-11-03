#!/etc/bash
wget https://raw.githubusercontent.com/chemist0086/DebianSetup/master/2.sh
wget https://raw.githubusercontent.com/chemist0086/DebianSetup/master/myvncserver.service
wget https://raw.githubusercontent.com/chemist0086/DebianSetup/master/myvncserver
sudo apt-get update
sudo apt-get install -y expect
sudo apt-get install -y xfce4 tightvncserver
sudo apt-get install -y iceweasel
wget https://fpdownload.adobe.com/get/flashplayer/pdc/27.0.0.183/flash_player_npapi_linux.x86_64.tar.gz
tar -xzf flash_player_npapi_linux.x86_64.tar.gz
mkdir -p ~/.mozilla/plugins/
cp libflashplayer.so  ~/.mozilla/plugins/

expect 2.sh

vncserver -kill :1
sudo mv myvncserver /usr/local/bin/myvncserver
sudo chmod +x /usr/local/bin/myvncserver
sudo mv myvncserver.service /lib/systemd/system/myvncserver.service
sudo systemctl daemon-reload
sudo systemctl enable myvncserver.service
sudo systemctl start myvncserver.service
sudo crontab -e
