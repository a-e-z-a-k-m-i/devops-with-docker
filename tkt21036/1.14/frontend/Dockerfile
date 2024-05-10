# Use Node.js v16 as base image
FROM node:16-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Install dependencies
RUN npm install --silent

# Build static files
ARG REACT_APP_BACKEND_URL=http://localhost:8080
RUN npm run build --silent

# Install serve package
RUN npm install -g serve --silent

# Expose port
ENV PORT=5000
EXPOSE $PORT

# Start app
CMD serve -s -l $PORT build