FROM postgres:15-alpine

# Install PgBouncer and postgresql-client
RUN apk add --no-cache pgbouncer postgresql-client

# Copy config files
COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY userlist.txt /etc/pgbouncer/userlist.txt

# Create pgbouncer user and set permissions
RUN adduser -D -s /bin/sh pgbouncer && \
    chown -R pgbouncer:pgbouncer /etc/pgbouncer

EXPOSE 5432

# Test script
RUN echo '#!/bin/sh' > /test-connection.sh && \
    echo 'echo "Testing PgBouncer connection..."' >> /test-connection.sh && \
    echo 'psql "postgresql://postgres:BFKhIErfHuyMJSOGQqNuTweKjoubHOGS@localhost:5432/railway" -c "SELECT 1;"' >> /test-connection.sh && \
    chmod +x /test-connection.sh

USER pgbouncer

# Start PgBouncer in background and run test
CMD ["sh", "-c", "pgbouncer /etc/pgbouncer/pgbouncer.ini & sleep 5 && /test-connection.sh && wait"]