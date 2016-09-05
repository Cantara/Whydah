Simple instruction to run whydah in a pre-built docker configuration


Steps:

 * Install docker
 * Run (sudo docker run -it -p 9000:9999 totto/whydah /usr/bin/supervisord)
 * Goto http://localhost:9000/sso/welcome


Congrats - you made it :!!



Steps to build custom images:

 * (Install docker)
 * Copy Dockerfile
 * Build container from Dockerfile (ie: sudo docker build -t="example/whydah-demo" .)
 * Run (sudo docker run -it -p 9000:9999 example/whydah /usr/bin/supervisord)
 * Goto http://localhost:9000/sso/welcome


Congrats - you made it !! Now you can change the configuration to your likings 

