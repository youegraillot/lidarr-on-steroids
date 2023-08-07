FROM registry.gitlab.com/bockiii/deemix-docker:latest@sha256:d325660d833c30c8bbb5cf0caa75135b42a2f69b82f2269fd5bea91a04c449e6 as deemix

FROM cr.hotio.dev/hotio/lidarr:pr-plugins-1.3.5.3463

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
VOLUME ["/config_deemix", "/downloads"]
EXPOSE 6595

COPY root /
RUN chmod +x /etc/services.d/*/run
VOLUME ["/config", "/music"]
EXPOSE 6595 8686
