# Use Node.js v16 as base image
FROM node:16-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Install dependencies, build static files, use non-root account
ARG REACT_APP_BACKEND_URL=http://localhost/api
RUN npm ci && \
    npm run build && \
    npm prune --production && \
    npm cache clean --force && \
    addgroup frontend && \
    adduser frontend -G frontend -D && \
    chown frontend:frontend /usr/src/app
USER frontend

# Expose port
ENV PORT=5000
EXPOSE $PORT

# Start app
CMD npx serve -s -l $PORT build