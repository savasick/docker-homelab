FROM linuxserver/qbittorrent:latest

RUN apk update && apk add rsync

COPY ./sync.sh /sync.sh

RUN chmod +x /sync.sh

CMD ["/sync.sh"]