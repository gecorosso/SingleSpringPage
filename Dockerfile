# STAGE 1: Build del progetto con Maven
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# STAGE 2: Immagine runtime leggera
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/page-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

