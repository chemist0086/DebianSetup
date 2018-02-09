#!/etc/expect
spawn sudo apt-get install -y xfce4 
expect "English"
send "\r"
interact