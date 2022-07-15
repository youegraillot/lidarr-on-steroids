FROM registry.gitlab.com/bockiii/deemix-docker:latest@sha256:044e67638166df141fbfb19737246d64d1b6f5edfc92ab4e97636b08e46ad75d as deemix

FROM cr.hotio.dev/hotio/lidarr:pr-plugins-1.1.0.2622

LABEL maintainer="youegraillot"

ENV DEEMIX_SINGLE_USER=true
ENV AUTOCONFIG=true
ENV PUID=1000
ENV PGID=1000

# flac2mp3
COPY lidarr-flac2mp3/root/usr /usr
RUN apk add --no-cache ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# deemix
COPY --from=deemix /deemix-server /deemix-server
RUN chmod +x /deemix-server
VOLUME "/config_deemix" "/downloads"
EXPOSE 6595

COPY root /
VOLUME "/config" "/music"
EXPOSE 6595 8686
