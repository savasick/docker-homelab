# <strong> Docker - Homelab </strong>

Collection of the applications used in homelabs\
All in one compose.file


<details>
<summary><strong>Apps</strong></summary>

[traefik](https://traefik.io) as reverse proxy\
[adminer](https://www.adminer.org) as web ui database management\
[gitea](https://about.gitea.com) as git server\
[portainer](https://www.portainer.io) as container orchestration

</details>


#


<h3>Requirements:</h3>
<ul>
<li>docker / docker-compose</li>
<li>mkcert</li>
</ul>

<details>
<summary> How to install <strong>mkcert</strong> at linux / macos / windows</summary>

<strong>linux</strong> by apt

```bash
sudo apt install mkcert libnss3-tools -y
```

<strong>macos</strong> by <a href="https://brew.sh/">brew</a>

```bash
brew install mkcert
```

<strong>windows</strong> by  <a href="https://chocolatey.org/install">chocolatey</a>

```shell
choco install mkcert
```

</details>

#


<h3>
self-signed certificates
</h3>


```bash
mkcert -install

# for traefik
mkcert -cert-file certs/certificate.pem -key-file certs/privatekey.pem "traefik.localhost" "gitea.localhost" "adminer.localhost" "portainer.localhost" "postgres"

# for postgres
mkcert -cert-file dockerfiles/postgres/server.crt -key-file dockerfiles/postgres/server.key "postgres"
```


#


<h3><strong>start</strong></h3>

```bash
docker-compose up -d
```

#

endpoints:

[traefik.localhost](https://traefik.localhost)\
[adminer.localhost](https://adminer.localhost)\
[gitea.localhost](https://gitea.localhost)\
[portainer.localhost](https://portainer.localhost)


#

<details>
<summary><strong>some commands</strong></summary>

delete certificates
```
rm -rf certs/certificate.pem certs/privatekey.pem dockerfiles/postgres/server.crt dockerfiles/postgres/server.key
```

</details>