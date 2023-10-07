FROM alpine:latest

ADD scripts /scripts

ADD entrypoints/entrypoint-user.sh /entrypoint-user.sh
ADD entrypoints/entrypoint.sh /entrypoint.sh
