#!/bin/sh
echo "This script will download scripts, whydah source, build from source and start Whydah"

wget https://raw.githubusercontent.com/Cantara/Whydah/master/dev-quickstart/getSource.sh
wget https://raw.githubusercontent.com/Cantara/Whydah/master/dev-quickstart/buildFullWhydah.sh
wget https://raw.githubusercontent.com/Cantara/Whydah/master/dev-quickstart/startFullWhydah.sh
chmod 755 *.sh
sh ./getSource.sh
sh ./buildFullWhydah.sh
sh ./startFullWhydah.sh
