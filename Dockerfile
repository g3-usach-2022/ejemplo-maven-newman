# Build stage
FROM maven:3.6.3-jdk-11 AS build
COPY . .
RUN mvn clean package -e -DskipTest

# Run stage
FROM openjdk:11-jre
COPY --from=build *.jar app.jar
CMD ["java", "-jar", "app.jar"]