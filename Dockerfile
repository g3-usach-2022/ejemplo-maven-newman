# Build stage
FROM openjdk:11-jdk as build
COPY DevOpsUsach2020-1.0.10-lab5.jar /app/
RUN cd /app && jar -xvf DevOpsUsach2020-1.0.10-lab5.jar

# Run stage
FROM openjdk:11-jre-slim
COPY --from=build /app/ /app/
CMD ["java", "-jar", "/app/DevOpsUsach2020-1.0.10-lab5.jar"]

