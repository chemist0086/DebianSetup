#!/etc/bash
wget http://ys-k.ys168.com/597833048/h5K5S27655JN63TWRgkw/2.sh
wget http://ys-k.ys168.com/597833051/VSSkjui5K5S276555NL/myvncserver.sh
wget http://ys-k.ys168.com/597833051/VSSkjui5K5S276555NM/myvncserver.service
sudo apt-get update
sudo apt-get install -y expect
sudo apt-get install -y xfce4 tightvncserver
sudo apt-get install -y iceweasel
wget https://fpdownload.adobe.com/get/flashplayer/pdc/26.0.0.151/flash_player_npapi_linux.x86_64.tar.gz
tar -xzf flash_player_npapi_linux.x86_64.tar.gz
mkdir -p ~/.mozilla/plugins/
cp libflashplayer.so  ~/.mozilla/plugins/

expect 2.sh

vncserver -kill :1
sudo mv myvncserver.sh /usr/local/bin/myvncserver
sudo chmod +x /usr/local/bin/myvncserver
sudo mv myvncserver.service /lib/systemd/system/myvncserver.service
sudo systemctl daemon-reload
sudo systemctl enable myvncserver.service
sudo systemctl start myvncserver.service

sudo echo "0 * * * * sudo shutdown -r now" >> /var/spool/cron/crontabs/root
sudo /etc/init.d/cron restart