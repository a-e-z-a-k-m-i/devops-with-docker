# Use Node.js v16 as base image
FROM node:16-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Install dependencies
RUN npm install --silent

# Build static files
RUN npm run build --quiet

# Install serve package
RUN npm install -g serve --silent

# Expose port
ENV PORT=5000
EXPOSE $PORT

# Use non-privileged account
RUN addgroup frontend && adduser frontend -G frontend -D
RUN chown -R frontend:frontend /usr/src/app
USER frontend

# Start app
CMD serve -s -l $PORT build