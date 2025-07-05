FROM postgres:15-alpine

RUN apk add --no-cache pgbouncer

COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY userlist.txt /etc/pgbouncer/userlist.txt

# Use the postgres user that already exists
RUN chown -R postgres:postgres /etc/pgbouncer

EXPOSE 5432
USER postgres

CMD ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]