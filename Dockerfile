# Etapa 1: build
FROM node:20 AS build

WORKDIR /app

# Copia tudo
COPY . .

# Ativa o corepack para yarn moderno
RUN corepack enable

# Vai para o serviço da API
WORKDIR /app/services/api

# Instala as dependências da API
RUN yarn install

# Etapa 2: runtime
FROM node:20-alpine

WORKDIR /app

# Copia só a API pronta
COPY --from=build /app/services/api .

ENV PORT=3000
EXPOSE 3000

CMD ["yarn", "start"]
