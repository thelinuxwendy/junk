#!/bin/bash

#renewal first
#certbot certonly --standalone -d ${DOMAINNAME} --text --agree-tos --email ${ACMEEMAIL} --server https://acme-v02.api.letsencrypt.org/directory --rsa-key-size 4096 --verbose --keep-until-expiring --preferred-challenges=http
#sleep 20
