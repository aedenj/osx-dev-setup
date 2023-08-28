#!/usr/bin/env bash

read -p "Email: ";
email=$REPLY;

read -p "Github Auth Token: ";
token=$REPLY;

read -p "Key Name: ";
name=$REPLY


ssh-keygen -f "${HOME}/.ssh/id_rsa" -t rsa -b 4096 -C "${email}" -N ''
sslpub="$(cat ${HOME}/.ssh/id_rsa.pub)"
curl -X POST \
	--header "Authorization: token ${token}" \
	--header "X-GitHub-Api-Version: 2022-11-28" \
      	--url https://api.github.com/user/keys \
     	--data "{\"title\":\"${name}\",\"key\":\"${sslpub}\"}"
