#!/etc/expect
spawn vncserver
expect "*assword:*"
send "722896\r"
expect "*erify*"
send "722896\r"
expect "*y*"
send "n\r"
interact