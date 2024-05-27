# STAGE 1: Build
FROM node:16-alpine AS build

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Install dependencies, build static files
ARG REACT_APP_BACKEND_URL=http://localhost/api
RUN npm ci && npm run build

# STAGE 2: Runtime
FROM node:16-alpine AS runtime

# Set working directory
WORKDIR /usr/src/app

# Copy static assets
COPY --from=build /usr/src/app/build ./build

# Use non-root account
RUN chown -R node:node /usr/src/app
USER node

# Expose port
ENV PORT=5000
EXPOSE $PORT

# Start app
CMD npx serve -s -l $PORT build