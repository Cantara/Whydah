#!/bin/sh

# Lets start three STS instances in the sts-mesh
sudo socketplane run -n sts-mesh -it cantara/whydah-sts
sudo socketplane run -n sts-mesh -it cantara/whydah-sts
sudo socketplane run -n sts-mesh -it cantara/whydah-sts

