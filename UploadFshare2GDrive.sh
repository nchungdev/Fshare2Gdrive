#!/bin/sh

echo "Login Fshare"

read -p "Username/Email:[default is chung3396@gmail.com] " username
read -sp "Password: " password

if [[ $username == *""* ]]; then
username=chung3396@gmail.com
fi

if [[ $password == *""* ]]; then
password=nYCu9D3Heh*7uG?
fi


echo "Logging..."

curl -sS https://raw.githubusercontent.com/duythongle/fshare2gdrive/master/fshare2gdrive.js | \
tail -n+2 | node - login $username $password

read -p "Enter Rclone Remote name: " rclone_name


read -p "Enter Fshare link: " link

if [[ $link == *"folder"* ]]; then

echo "Upload a folder" 
curl -sS https://raw.githubusercontent.com/duythongle/fshare2gdrive/master/fshare2gdrive.js | \
tail -n+2 | node - $link $rclone_name “/Rclone Upload/” | bash -s

else

echo "Upload single file"  
curl -sS https://raw.githubusercontent.com/duythongle/fshare2gdrive/master/fshare2gdrive.js | \
tail -n+2 | node - $link $rclone_name “/Rclone Upload/“ | bash -s

fi
