#!/usr/bin/env bash
echo stopping openldap
docker stop openldap
echo removing openldap
docker rm openldap
echo list active docker containers
docker ps
