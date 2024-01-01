# <strong> Docker - Homelab </strong>

Collection of the applications used in homelabs, with self-signed certificates\
All in one compose.file\
look at .env file


| Application | Description |
| :--------  | ---------: |
| [traefik](https://traefik.io) | Edge Router |
| [adminer](https://www.adminer.org) | database management |
| [gitea](https://about.gitea.com) | git server |
| [portainer](https://www.portainer.io) | container orchestration |
| [qbittorrent](https://www.qbittorrent.org) | P2P bittorrent web client |


#


<details>
<summary><strong>INSTALLATION</strong></summary>

</br>


1. <strong>Get mkcert</strong>

    <big><strong>linux</strong></big>
    
    install network security service libraries
    ```bash
    sudo apt install libnss3-tools -y
    ```

    get <a href="https://brew.sh/">brew</a>.
    when get it, install mkcert

    ```bash
    brew install mkcert
    ```

    #

    <big><strong>macos</strong></big>

    get <a href="https://brew.sh/">brew</a>.
    when get it, install mkcert / nss
    
    ```bash
    brew install mkcert
    brew install nss
    ```

    #

    <big><strong>windows</strong></big>

    get <a href="https://chocolatey.org/install">chocolatey</a>.
    when get it, install mkcert

    ```shell
    choco install mkcert
    ```

#

for <strong>install brew</strong>

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# add to .bashrc
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.bashrc
```

for <strong>install chocolatey</strong>

```shell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
may need to reopen terminal

#

2. <strong>Get self-signed certificates</strong>
    
    creates a local certification authority and registers it in the system’s trusted storage

    ```bash
    mkcert -install
    ```


    add certificates for apps

    ```bash
    mkcert -cert-file certs/certificate.pem -key-file certs/privatekey.pem "traefik.localhost" "gitea.localhost" "adminer.localhost" "portainer.localhost" "qbittorrent.localhost" "home.localhost"

    mkcert -cert-file apps-files/postgres/server.crt -key-file apps-files/postgres/server.key "postgres"
    ```
    
#

3. <strong>Now ready to start</strong>

    ```bash
    docker-compose up -d
    ```


</details>


#

<h3>endpoints:</h3>

[traefik.localhost](https://traefik.localhost)\
[adminer.localhost](https://adminer.localhost)\
[gitea.localhost](https://gitea.localhost)\
[portainer.localhost](https://portainer.localhost)\
[qbittorrent.localhost](https://qbittorrent.localhost)

[home.localhost](https://home.localhost)

#

<details>
<summary><strong>COMMANDS</strong></summary>

```bash
# get qbittorrent password for admin
docker-compose logs qbittorrent | grep session
```


```bash
# delete certificates
rm -rf certs/certificate.pem certs/privatekey.pem apps-files/postgres/server.crt apps-files/postgres/server.key
```


```bash
# delete data
rm -rf data || sudo rm -rf data
```

</details>
