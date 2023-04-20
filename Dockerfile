FROM maven:3.8.7-eclipse-temurin-17-alpine as build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean install
#ENV MONGODB_HOST=localhost
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/target/HMIS-0.0.1-SNAPSHOT.jar ./app.jar
EXPOSE 8080
#CMD ["java", "-jar", "app.jar"]