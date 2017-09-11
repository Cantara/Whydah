#!/bin/sh

echo "Starting Whydah All-In-One"
echo "Wait until it has started and go to http:/localhost:9997/sso/login"

echo "Log in with one of the users in testdata/users.csv"


sudo docker run -it -p 80:9997 -p 9990:9990 -p 9992:9992 -p 9995:9995 -p 9996:9996 -p 9997:9997 -p 9998:9998 -p 4901:4901 -p 12121:12121  whydah/whydah-all-in-one-image
