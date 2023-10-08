FROM joshhsoj1902/docker-linuxgsm-scripts:testing AS scripts
FROM ubuntu:22.04

COPY --from=scripts /scripts/apply-overlay.sh /apply-overlay.sh
ENV LGSM_HELPER_OVERLAY_SRC=/layers
ENV LGSM_HELPER_OVERLAY_DEST=/data
COPY layers /layers

RUN mkdir -p /data && echo "foo" >> /data/helloworld.txt
RUN ./apply-overlay.sh
RUN grep bar /data/helloworld.txt
