# docker - homelab

| Application | Description |
| :--------  | ---------: |
| [dashy](https://dashy.to/) | Home page |
| [adminer](https://www.adminer.org) | Database management |
| [gitea](https://about.gitea.com) | Git server |
| [qbittorrent](https://www.qbittorrent.org/) | Qbittorrent client |
| [filebrowser](https://filebrowser.org/) | File manager |

<details>
<summary><strong>about</strong></summary>
Homepage - Dashy, with some widgets and links for other homelab applications.

Gitea - where to store code, use ssh to connect for more secure.\
Adminer - to manage database for the applications.\
Qbittorrent - client for download torrents. Also every minute the files from Qbit transfer to Filebrowser.\
Filebrowser - to get downloads from Qbittorrent and get them from entire network.

Other:\
apps-files - folder for configuration.\
data - folder where all data stored.

For the first time use install.sh\
For Filebrowser login : admin  password : admin\
for Qbittorrent login : admin  password : (at logs see "help tips")
</details>

#

```bash
git clone https://github.com/savasick/docker-homelab.git
cd docker-homelab
docker-compose up -d
```

[127.0.0.1](http://127.0.0.1)

#




<details>
<summary><strong>help tips</strong></summary>

if change env, or need reinstall

```bash
bash install.sh
```

move to IP at .env

```bash
sed -i 's/\b[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\b/{IP}/g' ./apps-files/dashy/app/public/conf.yml
IP=$(cat .env | grep -o "IP=[^#]*" | cut -d= -f2 | tr -d \")
sed -i "s/{IP}/$IP/g" ./apps-files/dashy/app/public/conf.yml
```

show default login and pass
```bash
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
```

remove data
```bash
[ -d ./data ] && sudo rm -rf ./data
```

</details>