FROM postgres:14

# On Windows root will own the files, and they will have permissions 755
COPY server.key /var/lib/postgresql/server.key
COPY server.crt /var/lib/postgresql/server.crt

# update the privileges on the .key, no need to touch the .crt  
RUN chmod 600 /var/lib/postgresql/server.key
RUN chown postgres:postgres /var/lib/postgresql/server.key

#CMD [ "postgres -c ssl=on -c ssl_cert_file=/var/lib/postgresql/server.crt -c ssl_key_file=/var/lib/postgresql/server.key" ]