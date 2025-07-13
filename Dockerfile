FROM node:22.17.0-slim as builder

WORKDIR /app

COPY package*.json ./

RUN npm install 

COPY . .

EXPOSE 9000

RUN npx medusa db:migrate

RUN npx medusa user -e admin@medusa-test.com -p admin1234

CMD [ "npm", "run", "dev" ]
