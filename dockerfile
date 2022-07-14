FROM cr.hotio.dev/hotio/lidarr:pr-plugins

LABEL maintainer="youegraillot"

ENV DEEMIX_SINGLE_USER=true
ENV AUTOCONFIG=true

# flac2mp3
COPY lidarr-flac2mp3/root/usr /usr
RUN apk add --no-cache ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# deemix
COPY --from=registry.gitlab.com/bockiii/deemix-docker:latest /deemix-server /deemix-server
RUN chmod +x /deemix-server
VOLUME [ "/config_deemix" "/downloads" ]
EXPOSE 6595

COPY root /
VOLUME "/config"
EXPOSE 6595 8686
