#!/bin/sh
# Start script used by upstart. Should not be called directly if upstart is used. NOT CURRENTLY IN USE!
# TODO Decide if this should be used by upstart or not.
# -Dlogback.configurationFile=/home/UserIdentityBackend/logback.xml
nohup /usr/bin/java -DCONSTRETTO_TAGS=dev -jar /home/UserIdentityBackend/UserIdentityBackend.jar &