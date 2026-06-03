FROM docker.io/mysql:8.0

WORKDIR /schema

# Download and extract the database artifacts
COPY . .

# Copy an entrypoint script that handles the migration

RUN chmod +x /schema/load_schema.sh

ENTRYPOINT ["/bin/bash", "/schema/load_schema.sh"]