# Use Go 1.16 as base image
FROM golang:1.16

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Build project
ENV REQUEST_ORIGIN=*
RUN go build

# Run tests
RUN go test ./...

# Expose port
ENV PORT=8080
EXPOSE $PORT

# Start app
CMD ./server