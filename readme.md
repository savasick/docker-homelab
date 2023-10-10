# <strong> Docker - Homelab </strong>

Collection of the applications used in homelabs.\
All in one compose.file



<details>
<summary><strong>Apps</strong></summary>

[traefik](https://traefik.io) as reverse proxy\
[adminer](https://www.adminer.org) as web gui database management\
[gitea](https://about.gitea.com) as git server\
[jenkins](https://www.jenkins.io) as automation server 

</details>

<h3>Requirements:</h3>
<ul>
<li>docker / docker-compose</li>
<li>mkcert</li>
</ul>

<details>
<summary> How to install <strong>docker / docker-compose</strong> at linux / macos / windows</summary>

<strong>linux</strong> by apt

```bash
sudo apt install docker.io docker-compose -y
```

<strong>macos / windows</strong>

install <strong>docker desktop</strong> from <a href="https://www.docker.com/products/docker-desktop/">official site</a>
#
</details>



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
<strong>add TLS</strong> certificates by <strong>mkcert</strong></h3>

</br>

```bash
mkcert -install

mkcert -cert-file certs/certificate.pem -key-file certs/privatekey.pem "traefik.localhost" "gitea.localhost" "adminer.localhost" "jenkins.localhost"
```





#

<h3><strong>start</strong></h3>

```bash
docker-compose up -d
```
<details>
<summary><strong>Links</strong></summary>
https://

[traefik.localhost](https://traefik.localhost)\
[adminer.localhost](https://adminer.localhost)\
[gitea.localhost](https://gitea.localhost)\
[jenkins.localhost](https://jenkins.localhost)

</details>

