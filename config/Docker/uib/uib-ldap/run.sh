#!/usr/bin/env bash
docker run -d --name=openldap -p 13322:22 -p 13389:389 kimcs/whydah-openldap
