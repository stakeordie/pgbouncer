FROM pgbouncer/pgbouncer:latest

# Don't copy config files - let the entrypoint create them
# The image will auto-generate config from environment variables

EXPOSE 5432