FROM --platform=$BUILDARCH alpine:latest
LABEL MAINTAINER "Khashayar Danesh <k@idlethread.net>"

# install minidlna
RUN apk --no-cache add minidlna

# Add config file
ADD minidlna.conf /etc/minidlna.conf

# Copy entrypoint
COPY --chmod=755 entrypoint.sh /usr/bin/

EXPOSE 1900/udp
EXPOSE 8200

ENTRYPOINT [ "entrypoint.sh" ]
