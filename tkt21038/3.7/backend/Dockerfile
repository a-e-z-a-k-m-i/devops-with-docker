# Use Go 1.16 as base image
FROM golang:1.16-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Build project, run tests, use non-root account
ENV REQUEST_ORIGIN=*
RUN apk add --no-cache build-base && \
    go build -ldflags "-w -s" && \
    go test ./... && \
    go clean -cache && \
    go clean -modcache && \
    go clean -testcache && \
    apk del build-base && \
    addgroup backend && \
    adduser backend -G backend -D && \
    chown backend:backend /usr/src/app
USER backend

# Expose port
ENV PORT=8080
EXPOSE $PORT

# Start app
CMD ./server