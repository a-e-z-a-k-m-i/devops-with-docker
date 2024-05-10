# Use Ubuntu 22.04 as base image
FROM ubuntu:22.04

# Update package lists and install curl
RUN apt update
RUN apt install curl -y

# Copy script
COPY script.sh /tmp/script.sh

# Execute script
CMD bash /tmp/script.sh