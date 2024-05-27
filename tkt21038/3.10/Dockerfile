# STAGE 1: Build
FROM amazoncorretto:8-alpine AS build

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY ./ ./

# Build project using Maven Wrapper
RUN ./mvnw package

# STAGE 2: Runtime
FROM maslick/minimalka AS runtime

# Set working directory
WORKDIR /app

# Copy app package
COPY --from=build /usr/src/app/target/docker-example-1.1.3.jar ./

# Use non-privileged account
RUN useradd -U java
USER java

# Expose port
EXPOSE 8080

# Start app
CMD ["java", "-jar", "docker-example-1.1.3.jar"]