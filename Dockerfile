FROM node:14-stretch-slim as build
WORKDIR /app
COPY . /app
RUN apt-get update -qq && apt-get install -y build-essential nodejs

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
