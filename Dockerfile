# Usa una imagen base con Maven y OpenJDK 17 para construir la aplicación
FROM maven:3.9.2-openjdk-17 AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia el pom.xml y el código fuente al contenedor
COPY pom.xml .
COPY src ./src

# Construye el JAR
RUN mvn clean package

# Usa una imagen más ligera para ejecutar el JAR
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/render-0.0.1-SNAPSHOT.jar render.jar

# Comando para ejecutar el JAR
ENTRYPOINT ["java", "-jar", "render.jar"]
