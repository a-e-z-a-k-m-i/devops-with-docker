# Use Go 1.16 as base image
FROM golang:1.16-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Build project
RUN apk add build-base
RUN go build

# Run tests
RUN go test ./...

# Expose port
ENV PORT=8080
EXPOSE $PORT

# Use non-privileged account
RUN addgroup backend && adduser backend -G backend -D
RUN chown -R backend:backend /usr/src/app
USER backend

# Start app
CMD ./server