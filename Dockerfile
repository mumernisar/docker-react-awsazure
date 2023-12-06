FROM node:16-alpine as builder

USER node

WORKDIR  "/app"

COPY --chown=node:node ./package.json ./

RUN npm install

COPY --chown=node:node ./ ./

RUN npm run build




# Stage

FROM nginx
EXPOSE 80
EXPOSE 3000
COPY --from=builder /app/build /usr/share/nginx/html



