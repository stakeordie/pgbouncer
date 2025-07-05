FROM pgbouncer/pgbouncer:latest

USER root

# Create config directory and copy our custom config
RUN mkdir -p /etc/pgbouncer
COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY userlist.txt /etc/pgbouncer/userlist.txt

# Set proper permissions
RUN chown -R pgbouncer:pgbouncer /etc/pgbouncer && \
    chmod 644 /etc/pgbouncer/pgbouncer.ini && \
    chmod 644 /etc/pgbouncer/userlist.txt

USER pgbouncer

EXPOSE 5432

# Bypass the entrypoint script and run pgbouncer directly with our config
CMD ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]