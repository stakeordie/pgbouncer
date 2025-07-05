FROM pgbouncer/pgbouncer:latest

# Copy configuration files
COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY userlist.txt /etc/pgbouncer/userlist.txt

# Create necessary directories
RUN mkdir -p /var/log/pgbouncer

# Expose the port
EXPOSE 5432

# Start PgBouncer
CMD ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]