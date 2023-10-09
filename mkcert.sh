#!/bin/sh
mkcert -install

mkcert -cert-file certs/certificate.pem -key-file certs/privatekey.pem "traefik.localhost" "gitea.localhost" "adminer.localhost" "jenkins.localhost"