#!/bin/bash

# List of my commands and what they do
function commands(){
echo '|Command           |Description                            |'
echo '|------------------|---------------------------------------|'
echo '|whats-installed   |Lists Programs Ive Installed           |'
echo '|------------------|---------------------------------------|'
echo '|sudo nautilus     |Opens file manager as root             |'
echo '|------------------+---------------------------------------|'
echo '|killport port     |replace port with number to kill port  |'
echo '|------------------+---------------------------------------|'
echo '|ngrok http port   |Opens port to the web                  |'
echo '|------------------+---------------------------------------|'
echo '|convertAll        |Converts all mkvs to mp4 in directory  |'
echo '|------------------+---------------------------------------|'
echo '|bedtime           |Shuts down in 2 hours                  |'
echo '|------------------+---------------------------------------|'
echo '|startxampp        |Starts XAMPP Server on localhost       |'
echo '|------------------+---------------------------------------|'
echo '|htdocs            |cd into htdocs directory               |'
echo '|------------------+---------------------------------------|'
echo '|watches           |Increases max watches for JS error     |'
echo '+------------------+---------------------------------------+'
echo '                                                            '
echo 'Custom commands are kept in .my_commands.sh          '
echo 'Afer adding to this file use command source .my_commands.sh to reload file'
}


#Kills port
function killport(){
kill -9 `lsof -w -n -i tcp:$1| awk '{print $2}'|awk 'END{print}'`;
}

#Convert all files in directory
function convertAll(){
for i in *.avi; do
ffmpeg -i "$i" "${i%.*}.mp4"
done
}

#shuts down the computer in two hours
function bedtime() {
shutdown 120;
}

#Starts XAMPP server
function startxampp(){
	sudo /opt/lampp/lampp start;
}

#Changes to htdocs directory
function htdocs(){
	cd /opt/lampp/htdocs;
}

# Waches
function watches(){
	sudo sysctl fs.inotify.max_user_watches=524288;
	sudo sysctl -p;
}

# What's installed?
function whats-installed(){
echo 'Atom                       XAMPP';
echo 'Nodejs			 Postman';
}
