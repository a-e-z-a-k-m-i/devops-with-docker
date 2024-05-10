# Use OpenJDK v8 distro as base image
FROM amazoncorretto:8-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Build project using Maven Wrapper
RUN ./mvnw package --quiet

# Expose port
EXPOSE 8080

# Start application
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]