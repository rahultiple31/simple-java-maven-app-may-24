FROM openjdk
WORKDIR /app
COPY target/*.jar .
CMD ["java", "-jar", "*.jar"]
