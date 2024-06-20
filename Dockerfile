FROM alpine:3.20

COPY scripts /scripts

COPY entrypoints/entrypoint-user.sh /entrypoint-user.sh
COPY entrypoints/entrypoint.sh /entrypoint.sh
