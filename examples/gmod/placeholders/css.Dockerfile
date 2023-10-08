FROM joshhsoj1902/docker-linuxgsm-scripts:1.0.0 AS scripts
FROM gameservermanagers/gameserver:hl2dm

# Support running `auto-install` and exiting
COPY --from=scripts /entrypoint-user.sh /app/entrypoint-user.sh
COPY --from=scripts /entrypoint.sh /app/entrypoint.sh
