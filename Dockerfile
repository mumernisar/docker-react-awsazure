FROM node:16-alpine as build

USER node

WORKDIR  "/app"

COPY --chown=node:node ./package.json ./

RUN npm install

COPY --chown=node:node ./ ./

RUN npm run build

# Stage

FROM nginx

COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80

