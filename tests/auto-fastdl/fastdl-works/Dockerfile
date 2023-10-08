FROM joshhsoj1902/docker-linuxgsm-scripts:testing AS scripts
FROM gameservermanagers/gameserver:gmod

COPY --from=scripts /scripts/auto-fastdl.sh /auto-fastdl.sh

RUN mkdir -p /data/serverfiles/garrysmod/sound \
    && mkdir -p /data/serverfiles/garrysmod/lua/autorun/server \
    && echo "This is a song" >> /data/serverfiles/garrysmod/sound/song.wav \
    && chown -R 1000:1000 /data

USER linuxgsm
RUN ./linuxgsm.sh "${GAMESERVER}"

RUN /auto-fastdl.sh
RUN ls /app/public_html/fastdl/sound/song.wav.bz2
