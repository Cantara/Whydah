#!/bin/bash
/etc/init.d/postgresql start

export PGPASSWORD='secret'

echo "Creating role crmadmin"
psql --command "CREATE ROLE crmadmin LOGIN PASSWORD 'secret';"

echo "Creating database crmservice"
psql --command "CREATE DATABASE crmservice OWNER crmadmin;"

echo "Creating customer table in database"
psql -U crmadmin -d crmservice -h localhost --command "
        CREATE TABLE customers (
           customer_id    CHAR(256) PRIMARY KEY      NOT NULL,
           data           CHAR(25000) NOT NULL
        );
    "
        
echo "Creating profileimages table in database"
psql -U crmadmin -d crmservice -h localhost --command "
        CREATE TABLE profileimages (
           customer_id    CHAR(256) PRIMARY KEY      NOT NULL,
           image BYTEA,
           contenttype    CHAR(256)
        );
    "

echo "Granting on customers"
psql -U crmadmin -d crmservice -h localhost --command "
        GRANT ALL ON customers TO crmadmin;
    "

echo "Granting on profileimages"
psql -U crmadmin -d crmservice -h localhost --command "
        GRANT ALL ON profileimages TO crmadmin;
    "

echo "Stopping database. Will start with supervisor"
/etc/init.d/postgresql stop