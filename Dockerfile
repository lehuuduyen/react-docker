FROM node:latest as build
WORKDIR /app
COPY . /app
RUN npm cache clean --force
RUN npm install 
RUN npm cache clean --force && npm run build

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
