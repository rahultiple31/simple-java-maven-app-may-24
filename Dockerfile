FROM openjdk:17
WORKDIR /app
COPY target/*.jar .
CMD ["java", "-jar", "*.jar"]
