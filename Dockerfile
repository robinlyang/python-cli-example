# Use a lightweight Java 17 environment
FROM eclipse-temurin:17-jdk-alpine

# Create app directory
WORKDIR /app

# Copy your project files
COPY . .

# Install Maven on Alpine then run health check
RUN apk add --no-cache maven \
 && mvn -q -Dtest=HealthCheckTest test || (echo "Health check failed" && exit 1)

# Finish container execution successfully
CMD ["echo", "Docker health check complete"]
