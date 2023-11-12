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


#


<h3>
self-signed certificates
</h3>


```bash
mkcert -install

mkcert -cert-file certs/certificate.pem -key-file certs/privatekey.pem "traefik.localhost" "gitea.localhost" "adminer.localhost" "portainer.localhost" "postgres"
```
<small>

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
</small>


#


<h3><strong>start</strong></h3>

```bash
docker-compose up -d
```
<details>
<summary>Links</summary>

[traefik.localhost](https://traefik.localhost)\
[adminer.localhost](https://adminer.localhost)\
[gitea.localhost](https://gitea.localhost)\
[portainer.localhost](https://portainer.localhost)

</details>


