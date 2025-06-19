# Use a base Java runtime image
FROM eclipse-temurin:21-jre-alpine

# Set working directory inside the container
WORKDIR /app

# Copy the built jar from local into the container
COPY target/myapp.jar app.jar

# Expose the port your app listens on (e.g., 8080)
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]

