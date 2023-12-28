# <strong> Docker - Homelab </strong>

Collection of the applications used in homelabs\
All in one compose.file


| Application | Description |
| :--------  | ---------: |
| [traefik](https://traefik.io) | reverse proxy |
| [adminer](https://www.adminer.org) | database management |
| [gitea](https://about.gitea.com) | git server |
| [portainer](https://www.portainer.io) | container orchestration |


#


<details>
<summary><strong>INSTALLATION</strong></summary>

</br>


1. Get mkcert

    for <strong>linux</strong>

    ```bash
    sudo apt install libnss3-tools -y
    ```

    get <a href="https://brew.sh/">brew</a>.
    when get it, install mkcert

    ```bash
    brew install mkcert
    ```

    #

    for <strong>macos</strong>

    get <a href="https://brew.sh/">brew</a>.
    when get it, install mkcert
    
    ```bash
    brew install mkcert
    brew install nss
    ```

    #

    for <strong>windows</strong>

    get <a href="https://chocolatey.org/install">chocolatey</a>.
    when get it, install mkcert

    ```shell
    choco install mkcert
    ```

    #
    for brew
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # add to .bashrc
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.bashrc
    ```

    for chocolatey
    ```shell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```
    may need to reopen terminal
    #

2. Get <strong>self-signed certificates</strong>
    ```bash
    mkcert -install

    # for traefik
    mkcert -cert-file certs/certificate.pem -key-file certs/privatekey.pem "traefik.localhost" "gitea.localhost" "adminer.localhost" "portainer.localhost"

    # for postgres
    mkcert -cert-file apps-files/postgres/server.crt -key-file apps-files/postgres/server.key "postgres"
    ```
    
    #

3. Now ready to <strong>start</strong>

    ```bash
    docker-compose up -d
    ```


</details>


#

<h3>endpoints:</h3>

[traefik.localhost](https://traefik.localhost)\
[adminer.localhost](https://adminer.localhost)\
[gitea.localhost](https://gitea.localhost)\
[portainer.localhost](https://portainer.localhost)

#

<details>
<summary><strong>COMMANDS</strong></summary>


```bash
# delete certificates
rm -rf certs/certificate.pem certs/privatekey.pem apps-files/postgres/server.crt apps-files/postgres/server.key
```


```bash
# delete data
rm -rf data || sudo rm -rf data
```

</details>

#

some trouble :c\
safari wont open links, all other browsers works fine\
couse nobody likes self-signed certificates