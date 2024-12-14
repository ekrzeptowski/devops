FROM node:slim

ENV NODE_ENV development

WORKDIR /app

COPY . .

RUN npm ci

CMD [ "node", "./bin/www" ]

EXPOSE 5000