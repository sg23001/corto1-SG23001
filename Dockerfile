FROM maven:3.8.4-jdk-11-slim AS build

WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT [ "java", "-jar", "app.jar" ]
