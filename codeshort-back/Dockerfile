# Local
# Build stage
#FROM maven:3.9.5-eclipse-temurin-17-alpine AS build
#COPY . .
#RUN mvn clean verify

# Package stage
#FROM eclipse-temurin:17-alpine
#COPY --from=build ./target/*.jar codeshort.jar
#CMD ["java", "-jar", "codeshort.jar"]

# With github actions
FROM eclipse-temurin:17-alpine
COPY ./target/*.jar codeshort.jar
CMD ["java", "-jar", "codeshort.jar"]