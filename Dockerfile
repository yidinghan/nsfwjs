FROM node:10 as npminstall

WORKDIR /app
COPY ./example/nsfw_demo /app
RUN npm i && \
    npm run build

FROM nginx:1.17.0-alpine
COPY --from=npminstall /app/build /usr/share/nginx/html
