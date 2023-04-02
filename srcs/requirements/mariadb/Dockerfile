FROM    alpine:3.14.2
LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update 

RUN     apk add mariadb mariadb-client; apk add openrc

COPY	./tools/wordpress.sql /
COPY    ./tools/run.sh /
RUN     chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "run.sh"]
