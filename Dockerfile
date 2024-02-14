# Use an official Maven image as a build stage
FROM maven:3.8.4 AS build
WORKDIR /var
COPY . .
RUN mvn clean package

# Use an OpenJDK JRE as the base image
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /var/lib/jenkins/workspace/cicd/target/my-devops-project-1.0.0.jar /app/my-devops-project-1.0.0.jar

CMD ["java", "-jar", "my-devops-project-1.0.0.jar"]
