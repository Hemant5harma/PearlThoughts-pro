FROM node:22.17.0-slim

WORKDIR /app

COPY package*.json ./

RUN npm install 

COPY . .

EXPOSE 9000

# Pass DATABASE_URL as an environment variable
ARG DATABASE_URL
ENV DATABASE_URL=${DATABASE_URL}

# Set additional environment variables
ENV MEDUSA_ADMIN_ONBOARDING_TYPE=default
ENV NODE_TLS_REJECT_UNAUTHORIZED=0

# Run database migrations
RUN npx medusa db:migrate

# Create an admin user
RUN npx medusa user -e admin@medusa-test.com -p admin1234

CMD [ "npm", "run", "dev" ]
