#!/bin/bash
/etc/init.d/postgresql start

echo "Creating role crmadmin"
psql --command "CREATE ROLE crmadmin LOGIN PASSWORD 'secret';"

echo "Creating database crmservice"
psql --command "CREATE DATABASE crmservice OWNER crmadmin;"

echo "Stopping database. Will start with supervisor"
/etc/init.d/postgresql stop