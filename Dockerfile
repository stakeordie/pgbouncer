FROM postgres:15-alpine

RUN apk add --no-cache pgbouncer

COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY userlist.txt /etc/pgbouncer/userlist.txt

EXPOSE 5432

CMD ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]