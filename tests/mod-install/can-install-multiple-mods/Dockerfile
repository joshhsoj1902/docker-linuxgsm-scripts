FROM joshhsoj1902/docker-linuxgsm-scripts:testing AS scripts
FROM gameservermanagers/gameserver:gmod

COPY --from=scripts /scripts/mod-install.sh /mod-install.sh

RUN mkdir -p /data/serverfiles/garrysmod/ \
    && chown -R 1000:1000 /data

USER linuxgsm
RUN ./linuxgsm.sh "${GAMESERVER}"

ENV LGSM_HELPER_MODS=ulib,ulx
RUN /mod-install.sh
RUN ls /data/serverfiles/garrysmod/addons/ulib-master
RUN ls /data/serverfiles/garrysmod/addons/ulx-master
