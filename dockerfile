FROM registry.gitlab.com/bockiii/deemix-docker:latest@sha256:1c7e5e2cecb8d10e897f50d5d5e0a1e3320b342cec679308c69734a06300cf73 as deemix

FROM cr.hotio.dev/hotio/lidarr:pr-plugins-1.1.0.2629

LABEL maintainer="youegraillot"

ENV DEEMIX_SINGLE_USER=true
ENV AUTOCONFIG=true
ENV PUID=1000
ENV PGID=1000

# flac2mp3
RUN apk add --no-cache ffmpeg && \
    rm -rf /var/lib/apt/lists/*
COPY lidarr-flac2mp3/root/usr /usr

# deemix
COPY --from=deemix /deemix-server /deemix-server
RUN chmod +x /deemix-server
VOLUME "/config_deemix" "/downloads"
EXPOSE 6595

COPY root /
VOLUME "/config" "/music"
EXPOSE 6595 8686
