#!/usr/bin/env bash
docker run -d --name=whydah-uib-ldap --volumes-from=whydah-uib-ldap-data -p 13322:22 -p 13389:389 cantara/whydah-uib-ldap
