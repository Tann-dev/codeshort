# Build stage
FROM maven:3.9.5-eclipse-temurin-17-alpine AS build
COPY . .
RUN mvn verify

# Package stage
FROM eclipse-temurin:17-alpine
COPY --from=build ./target/*.jar codeshort.jar
EXPOSE 8080
CMD ["java", "-jar", "codeshort.jar"]

# With github actions
#FROM eclipse-temurin:17-alpine
#COPY ./target/codeshort-backend-0.0.1-SNAPSHOT.jar .
#EXPOSE 8080
#CMD ["sh","-c","java -XX:InitialRAMPercentage=50 -XX:MaxRAMPercentage=70  -XshowSettings $JAVA_OPTS -jar codeshort-backend-0.0.1-SNAPSHOT.jar"]