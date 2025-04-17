# Usa a imagem oficial do Node.js (versão 20 para compatibilidade)
FROM node:20

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências
COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn ./.yarn

# Instala as dependências
RUN yarn install

# Copia o restante do projeto
COPY . .

# Build do projeto (se necessário, ajustaremos depois)
RUN yarn build

# Comando para iniciar o projeto
CMD ["yarn", "start"]