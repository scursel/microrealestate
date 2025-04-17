# Etapa 1: build
FROM node:20 AS build

WORKDIR /app

# Copia tudo
COPY . .

# Instala dependências com Yarn 3 (usando workspaces)
RUN corepack enable && yarn install

# Builda o projeto (opcional, se houver build)
RUN yarn build || echo "No build script"

# Etapa 2: runtime
FROM node:20-alpine

WORKDIR /app

COPY --from=build /app .

CMD ["yarn", "start"]
