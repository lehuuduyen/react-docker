FROM mhart/alpine-node:11 as build
WORKDIR /app
COPY . /app
RUN yarn run build

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
