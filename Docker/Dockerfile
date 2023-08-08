# Imagen base
FROM ubuntu:20.04

# Variables de entorno
ENV DEBIAN_FRONTEND=noninteractive
ENV ANDROID_HOME /opt/android-sdk
ENV PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Instalar unzip y otras dependencias necesarias
RUN apt-get update && apt-get install -y unzip curl wget openjdk-11-jdk git

# Instalar Node.js y npm
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Instalar dependencias adicionales para Expo
RUN npm install -g expo-cli@latest

# Imprimir el valor de ANDROID_HOME
RUN echo "ANDROID_HOME: ${ANDROID_HOME}"

# Descargar e instalar el SDK de Android
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    cd ${ANDROID_HOME}/cmdline-tools && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O android-sdk.zip && \
    unzip android-sdk.zip && \
    mv cmdline-tools latest && \
    rm android-sdk.zip

# Aceptar las licencias de Android SDK
RUN yes | ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --licenses

# Agregar ${ANDROID_HOME}/cmdline-tools/latest/bin a la variable PATH
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin

# Instalar las plataformas y herramientas de Android
RUN sdkmanager "platforms;android-30" "build-tools;30.0.2"

# Instalar #Git
RUN apt-get update && apt-get install -y git

ARG GITHUB_USERNAME
ARG GITHUB_TOKEN

# Clonar repositorio desde GitHub
RUN git clone https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/Oskhar-ogg/TDD2023-BACKEND.git /app

# Cambiar al directorio mdiback y ejecutar npm start
WORKDIR /app
RUN npm install 
RUN npm run build

# Exponer puerto para Expo
EXPOSE 3000
EXPOSE 8081
# Comando para iniciar la aplicación
CMD [ "npm", "start" ]