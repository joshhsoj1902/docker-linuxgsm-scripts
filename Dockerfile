FROM alpine:3.18

COPY scripts /scripts

COPY entrypoints/entrypoint-user.sh /entrypoint-user.sh
COPY entrypoints/entrypoint.sh /entrypoint.sh
