FROM alpine:3.11

RUN apk update
RUN apk --no-cache add openssh-client rsync lsyncd
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
