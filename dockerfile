FROM pgbouncer/pgbouncer:1.21.0

# Copy configuration files
COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY userlist.txt /etc/pgbouncer/userlist.txt

# Create logs directory
RUN mkdir -p /var/log/pgbouncer

EXPOSE 5432

CMD ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]