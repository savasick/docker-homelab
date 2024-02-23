#!/bin/bash


# move to factory settings
sed -i 's/\b[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\b/{IP}/g' ./apps-files/dashy/app/public/conf.yml
[ -d ./data ] && sudo rm -rf ./data
# get ip from env
IP=$(cat .env | grep -o "IP=[^#]*" | cut -d= -f2 | tr -d \")
# replace all {IP} with ip at env
sed -i "s/{IP}/$IP/g" ./apps-files/dashy/app/public/conf.yml

# down
docker-compose down -v
if [ $? -ne 0 ]; then
  sudo docker-compose down -v
fi
# up
docker-compose up -d --build
if [ $? -ne 0 ]; then
  sudo docker-compose up -d --build
fi


# show default login and pass
LOGIN=admin
PASS_QBIT=$(docker-compose logs qbittorrent | grep session | grep -o -P '(?<=: ).*$' | tail -n 1)
if [ $? -ne 0 ]; then
  PASS_QBIT=$(sudo docker-compose logs qbittorrent | grep session | grep -o -P '(?<=: ).*$' | tail -n 1)
fi
PASS_FILE=admin

echo "qbittorrent"
echo "login:    ${LOGIN}"
echo "password: ${PASS_QBIT}"

echo "filebrowser"
echo "login:    ${LOGIN}"
echo "password: ${LOGIN}"

echo "IP from env"
echo "http://${IP}/"