#FROM openjdk
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY target/*.jar .
CMD ["java", "-jar", "*.jar"]
