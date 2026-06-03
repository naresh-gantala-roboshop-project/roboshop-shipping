FROM alpine:3.19

# Install the actual Oracle mysql-client, curl, and unzip
RUN apt-get update && apt-get install -y --no-install-recommends \
    default-mysql-client \
    curl \
    unzip \
    bash \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /schema

# Download and extract the database artifacts
COPY . .

# Copy an entrypoint script that handles the migration

RUN chmod +x /schema/load_schema.sh

ENTRYPOINT ["/bin/bash", "/schema/load_schema.sh"]