# STAGE 1: Build
FROM golang:1.16-alpine AS build

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Build project, run tests, compress binary
RUN apk add --no-cache build-base upx && \
    go env -w CGO_ENABLED=0 && \
    go build -o server -a && \
    go test ./... && \
    upx server

# STAGE 2: Runtime
FROM scratch AS runtime

# Set working directory
WORKDIR /

# Copy server binary
COPY --from=build /usr/src/app/server ./server

# Cross-Origin Resource Sharing (CORS) bypass
ENV REQUEST_ORIGIN=*

# Expose port
ENV PORT=8080
EXPOSE $PORT

# Start app
CMD ["./server"]