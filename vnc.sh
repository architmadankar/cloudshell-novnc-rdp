#!/bin/sh

#making ngrok directory 
#mkdir ngrok

#changing directory to ngrok
#cd ngrok

#removing all existing files 
#rm * 

#removing all existing folders 
#rm -r *

#downloading ngrok stable from official webserver
wget 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz'

#unzipping ngrok-stable-linux-amd64.zip in selected folder
tar -xvzf ngrok-v3-stable-linux-amd64.tgz

#asking ngrok auth token
echo " Go to ngrok.io in any browser & signin or signup, copy the ngrok auth token and paste here, ngrok token only  (example - 4OXX56rxxxI00QGKnXXXXZ0_3xSAyW24irP0A0ie0bo0B)  Ngrok Auth token: "
read input_token
echo "You entered: $input_token"
./ngrok config add-authtoken $input_token


#updating system
sudo apt update -y

#installing screen
sudo apt-get install screen -y


#Activating screen
#pushing docker ubuntu desktop using screen (you can change resolution from below code) 
screen -d -m docker run -p 8080:80 -e RESOLUTION=1920x1080 -v ubuntu

./ngrok http 8080
