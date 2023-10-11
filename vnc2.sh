#!/bin/sh

# Making ngrok directory (you can uncomment if you want to create a directory)
# mkdir ngrok

# Changing directory to ngrok (you can uncomment if you want to change directory)
# cd ngrok

# Removing all existing files and folders
# Be cautious with this command - it can remove important files/folders if not used carefully
# rm -rf *

# Downloading ngrok stable from the official webserver
wget 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz'

# Unzipping ngrok
tar -xvzf ngrok-v3-stable-linux-amd64.tgz

# Asking for ngrok auth token
echo "Go to ngrok.io in any browser, sign in or sign up, copy the ngrok auth token, and paste here. Ngrok Auth token (example - 4OXX56rxxxI00QGKnXXXXZ0_3xSAyW24irP0A0ie0bo0B): "
read input_token
echo "You entered: $input_token"
./ngrok authtoken $input_token

# Updating the system
sudo apt update -y

# Installing screen
sudo apt-get install screen -y

# Activating screen
# Starting an SSH server in a screen session (you can adjust settings as needed)
screen -dmS ssh-session ssh -o PermitRootLogin=no -o PasswordAuthentication=yes your_username@localhost

# Starting ngrok to expose the SSH port (22)
./ngrok tcp 22
