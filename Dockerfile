FROM node:22.17.0-slim as builder

WORKDIR /app

COPY package*.json ./

RUN npm install 

COPY . .

EXPOSE 9000

CMD [ "npm", "run", "dev" ]

# FROM node:22.17.0-slim

# WORKDIR /app

# COPY --from=builder /app/dist ./dist

# COPY --from=builder /app/package*.json ./

# RUN npm install --legacy-peer-deps --omit=dev

# EXPOSE 4000

# CMD ["node", "dist/main.js"]