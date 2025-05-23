# Base image with JDK
FROM openjdk:8-jdk-alpine

# Set working directory
WORKDIR /app

# Copy the jar file generated by Maven build from Jenkins workspace
COPY ./target/simple-springboot-app-0.0.1-SNAPSHOT.jar app.jar

# Command to run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
