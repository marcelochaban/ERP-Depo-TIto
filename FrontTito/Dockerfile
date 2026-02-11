FROM node:20 AS dev
WORKDIR /app

# Instalamos Angular CLI globalmente
RUN npm install -g @angular/cli@19

# Copiamos archivos de dependencias
COPY package*.json ./
RUN npm install

# Copiamos el resto del código
COPY . .
# Exponemos el puerto de Angular
EXPOSE 4200
# Comando para desarrollo con hot-reload y acceso externo
CMD ["ng", "serve", "--host", "0.0.0.0"]