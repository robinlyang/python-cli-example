# Use a lightweight Java 17 environment
FROM eclipse-temurin:17-jdk-alpine

# Create app directory
WORKDIR /app

# Copy your project files
COPY . .

# Install Maven
RUN apt-get update && apt-get install -y maven

# Run a simple health check: compile + run a single test
# Adjust "HealthCheckTest" to your actual test if needed
RUN mvn -q -Dtest=HealthCheckTest test || (echo "Health check failed" && exit 1)

# Finish container execution successfully
CMD ["echo", "Docker health check complete"]
