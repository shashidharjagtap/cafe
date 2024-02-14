# Use an official Maven image as a build stage
FROM maven:3.8.4 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Use an OpenJDK JRE as the base image
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/your-application.jar .
CMD ["java", "-jar", "your-application.jar"]
