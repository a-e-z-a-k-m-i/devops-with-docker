# Use Node.js v16 as base image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Install project dependencies
RUN npm install --silent

# Build static files
RUN npm run build --quiet

# Install serve package
RUN npm install -g serve --silent

# Expose port
ENV port=5000
EXPOSE $port

# Start app
CMD serve -s -l $port build