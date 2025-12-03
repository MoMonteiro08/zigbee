ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM $BUILD_FROM

ARG ADDON_VERSION
ENV ADDON_VERSION=${ADDON_VERSION}

WORKDIR /app

# Copiar arquivos do Zigbee2MQTT
COPY data/ ./

# Instalar Node.js e dependências
RUN apk add --no-cache nodejs npm git \
    && npm install

# Comando padrão ao iniciar o addon
CMD ["npm", "start"]
