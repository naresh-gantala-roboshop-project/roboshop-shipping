FROM alpine:3.19

# Install mysql-client, curl, and unzip
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/v3.19/community/ mysql-client curl unzip bash

WORKDIR /schema

# Download and extract the database artifacts
COPY . .

# Copy an entrypoint script that handles the migration

RUN chmod +x /schema/load_schema.sh

ENTRYPOINT ["/bin/bash", "/schema/load_schema.sh"]