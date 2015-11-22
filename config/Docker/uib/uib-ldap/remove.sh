#!/usr/bin/env bash
echo stopping whydah-uib-ldap
docker stop whydah-uib-ldap
echo removing whydah-uib-ldap
docker rm whydah-uib-ldap
