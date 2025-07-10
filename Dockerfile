FROM ubuntu:25.10
ENV CRON="*/5 * * * *"

RUN apt-get update \
    && apt-get install -y --no-install-recommends git cron \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /git
COPY gitpull.sh /usr/bin
COPY cronjob /etc/cron.d/cronjob

RUN touch /var/log/cron.log

CMD crontab /etc/cron.d/cronjob && cron && tail -f /var/log/cron.log
