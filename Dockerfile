FROM node:10-alpine as build
WORKDIR /app
COPY . /app

RUN npm install  && npm  run build -prod

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
