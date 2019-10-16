#!/usr/bin/env bash

read -p "Email: ";
email=$REPLY;

read -p "Github Username: ";
username=$REPLY;

read -p "Key Name: ";
name=$REPLY


ssh-keygen -f "${HOME}/.ssh/id_rsa" -t rsa -b 4096 -C "${email}" -N ''
sslpub="$(cat ${HOME}/.ssh/id_rsa.pub)"
curl -u "${username}" \
     --data "{\"title\":\"${name}\",\"key\":\"${sslpub}\"}" \
     https://api.github.com/user/keys
