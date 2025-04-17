# Usa a imagem oficial do Node.js
FROM node:20

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências
COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn ./.yarn

# Instala as dependências
RUN yarn install

# Copia apenas o workspace landlord
COPY webapps/landlord ./webapps/landlord

# Build do landlord
RUN yarn workspace @microrealestate/landlord run build

# Expõe a porta 3000
EXPOSE 3000

# Inicia o landlord
CMD ["yarn", "workspace", "@microrealestate/landlord", "run", "start"]