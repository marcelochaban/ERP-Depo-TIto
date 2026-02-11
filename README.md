# Sistema Tito

Sistema full stack dockerizado compuesto por: - Backend: Java + Spring
Boot - Frontend: Angular - Base de datos: MySQL - Orquestación: Docker +
Docker Compose

------------------------------------------------------------------------

## 📦 Requisitos

-   Docker Desktop
-   Docker Compose
-   MySQL Workbench (opcional)
-   Git

------------------------------------------------------------------------

## 📁 Estructura del proyecto

    Sistema-Tito/
    ├── backend/
    ├── frontend/
    ├── docker-compose.yml
    ├── docker-compose.dev.yml
    ├── docker-compose.prod.yml
    └── README.md

------------------------------------------------------------------------

## 🚀 Iniciar proyecto en modo DESARROLLO (DEV)

Modo desarrollo con hot reload y volúmenes.

### ▶️ Levantar contenedores

Desde la raíz del proyecto:

``` bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml up
```

### 🌐 Accesos

-   Frontend: http://localhost:4200
-   Backend: http://localhost:8080
-   MySQL: localhost:3306

------------------------------------------------------------------------

## 🛑 Detener el proyecto (DEV o PROD)

### ⏹️ Parar contenedores (sin borrar datos)

``` bash
docker compose down
```

✔️ Los datos de MySQL se conservan\
✔️ Podés volver a levantar cuando quieras

------------------------------------------------------------------------

### 💣 Parar y borrar TODO (incluye base de datos)

⚠️ Uso extremo --- borra datos

``` bash
docker compose down -v
```

------------------------------------------------------------------------

## 🐬 Acceso a MySQL desde Workbench

-   Host: 127.0.0.1
-   Puerto: 3306
-   Usuario: app_user
-   Password: app_pass
-   Base de datos: app_db

------------------------------------------------------------------------

## 📄 Logs de los servicios

Ver logs individuales:

``` bash
docker compose logs backend
docker compose logs frontend
docker compose logs mysql
```

Ver logs en tiempo real:

``` bash
docker compose logs -f backend
```

------------------------------------------------------------------------

## 🏭 Iniciar proyecto en modo PRODUCCIÓN (PROD)

Modo optimizado: - Angular compilado - Sin hot reload - Configuración
estable

### ▶️ Levantar producción

``` bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml up --build
```

📌 --build es obligatorio en producción

------------------------------------------------------------------------

### ⏹️ Detener producción

``` bash
docker compose down
```

------------------------------------------------------------------------

## 🔁 Rebuild completo (cuando cambian Dockerfiles)

``` bash
docker compose down
docker compose up --build
```

------------------------------------------------------------------------

## 🧠 Notas importantes

-   No editar código dentro de los contenedores
-   Usar --build solo cuando cambien dependencias o Dockerfiles
-   La base de datos se crea automáticamente al primer arranque
-   No usar localhost en Spring Boot (usar nombre del servicio Docker)

------------------------------------------------------------------------

## 👨‍💻 Autor

Marcelo
