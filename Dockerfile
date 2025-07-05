FROM ubuntu:22.04

# Install PgBouncer
RUN apt-get update && \
    apt-get install -y pgbouncer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy configuration files
COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY userlist.txt /etc/pgbouncer/userlist.txt

# Create pgbouncer user and directories
RUN useradd -r -s /bin/false pgbouncer && \
    mkdir -p /var/log/pgbouncer && \
    chown -R pgbouncer:pgbouncer /etc/pgbouncer /var/log/pgbouncer

# Expose the port
EXPOSE 5432

# Switch to pgbouncer user
USER pgbouncer

# Start PgBouncer
CMD ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]