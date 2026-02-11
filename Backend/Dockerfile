# Etapa de desarrollo: compila y corre con hot-reload (opcional)
FROM maven:3.9.6-eclipse-temurin-17 AS dev
WORKDIR /app
# Copiamos solo el pom.xml primero para aprovechar la caché de Docker
COPY pom.xml .
RUN mvn dependency:go-offline
# Copiamos el código fuente
COPY src ./src
# Comando para desarrollo: compila y corre la app
CMD ["mvn", "spring-boot:run"]