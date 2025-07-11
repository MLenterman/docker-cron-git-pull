FROM alpine:3.22.0

ENV CRON="*/5 * * * *"

RUN apk update && apk add git

WORKDIR /git
COPY --chmod=+x gitpull.sh /usr/bin
COPY --chmod=+x entrypoint.sh /entrypoint.sh

CMD ["crond", "-f", "-l", "2"]
ENTRYPOINT [ "/entrypoint.sh" ]
