FROM node:alpine as base

ENV NODE_ENV=production
WORKDIR /app

COPY package*.json ./

FROM base AS build-deps
RUN npm ci --include=dev

FROM base AS production
RUN npm ci --omit=dev

FROM base AS builder
COPY --chown=node:node . .
COPY --from=build-deps /app/node_modules ./node_modules
RUN npm run build

FROM base AS runner
USER node
COPY --from=production /app/node_modules ./node_modules
COPY --from=builder /app/build ./build

EXPOSE 5000
CMD [ "node", "./build/app.js" ]
