FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . /app
RUN mvn clean package
CMD ["java", "-jar", "target/page-0.0.1-SNAPSHOT.jar"]

