FROM postgres:15-alpine

# Install PgBouncer
RUN apk add --no-cache pgbouncer

# Create pgbouncer user (it doesn't exist in postgres image)
RUN addgroup -g 999 pgbouncer && \
    adduser -D -u 999 -G pgbouncer -s /bin/sh pgbouncer

# Copy config files
COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY userlist.txt /etc/pgbouncer/userlist.txt

# Set permissions
RUN chown -R pgbouncer:pgbouncer /etc/pgbouncer

EXPOSE 5432
USER pgbouncer

CMD ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]