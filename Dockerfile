FROM pgbouncer/pgbouncer:1.21.0

# Copy configuration files
COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY userlist.txt /etc/pgbouncer/userlist.txt

# Create necessary directories
RUN mkdir -p /var/log/pgbouncer && \
    chown -R pgbouncer:pgbouncer /var/log/pgbouncer

EXPOSE 5432

# Run as pgbouncer user
USER pgbouncer

CMD ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]