FROM openjdk:22-ea-19-slim-bullseye
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]