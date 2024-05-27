# Use Docker as base image
FROM docker

# Set working directory
WORKDIR /tmp

# Copy script
COPY ./builder.sh ./

# Install dependencies
RUN apk update && apk add bash curl

# Execute script
ENTRYPOINT ["/bin/bash"]
CMD ["builder.sh"]