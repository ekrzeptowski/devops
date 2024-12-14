FROM node:slim

ENV NODE_ENV=production

WORKDIR /app

COPY . .

RUN npm ci

CMD [ "node", "./bin/www" ]

EXPOSE 5000