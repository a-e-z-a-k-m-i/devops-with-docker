# Use Ubuntu v22.04 as base image
FROM ubuntu:jammy

# Set working directory
WORKDIR /usr/src/app

# Install missing dependencies
RUN apt-get update -qq
RUN apt-get install -yqq curl python3

# Download yt-dlp executable
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp

# Run executable
RUN chmod +x /usr/local/bin/yt-dlp
ENTRYPOINT ["/usr/local/bin/yt-dlp"]