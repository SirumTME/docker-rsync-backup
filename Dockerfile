FROM debian:buster-slim

ENV REMOTE_HOSTNAME="" \
    BACKUPDIR="/home" \
    SSH_PORT="22" \
    SSH_IDENTITY_FILE="/root/.ssh/id_rsa" \
    ARCHIVEROOT="/backup" \
    EXCLUDES="" \
    CRON_TIME="0 1 * * *" \
    KEEP_DAYS=30

RUN apt-get update && apt-get install --no-install-recommends -y cron rsync openssh-client

COPY docker-entrypoint.sh /usr/local/bin/
COPY backup.sh /backup.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["cron"]
