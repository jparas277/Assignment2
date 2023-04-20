FROM node:16.17.1-alpine3.16 as build
WORKDIR /usr/app
COPY package.json /usr/app
COPY package-lock.json /usr/app
RUN npm ci
COPY . /usr/app
RUN npm run build

FROM nginx:1.23.1-alpine
EXPOSE 80
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /usr/app/build /usr/share/nginx/html