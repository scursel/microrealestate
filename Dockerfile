FROM node:20
WORKDIR /app
COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn ./.yarn
COPY webapps ./webapps
COPY services ./services
RUN yarn install
RUN yarn workspace @microrealestate/landlord run build
EXPOSE 3000
CMD ["yarn", "workspace", "@microrealestate/landlord", "run", "start"]