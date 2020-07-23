# Development build
FROM openjdk:8-jdk-alpine AS development

# Create app directory into Docker container
WORKDIR /data

# Build project
COPY . ./
RUN ./mvnw package

# --------------------------------

# Production build
FROM openjdk:8-jdk-alpine AS production

# Expose container port
EXPOSE 8081

# Create app directory into Docker container
WORKDIR /data

# Bundle app source
COPY --from=development /data/target/*.jar ./petclinic.jar

# Let's run the app!
CMD ["java", "-jar", "/data/petclinic.jar", "--server.port=8081", "--spring.profiles.active=mysql"]
