FROM registry.gitlab.com/bockiii/deemix-docker:latest@sha256:b502d80d7e9c8a97bf1d9c585597e1a54527efa01b1273bc80f05040a5fea12e as deemix

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
