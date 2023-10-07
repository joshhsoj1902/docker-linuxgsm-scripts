FROM alpine:latest

ADD scripts /scripts

ADD entrypoint-user.sh /entrypoint-user.sh
ADD entrypoint.sh /entrypoint.sh
