FROM node:14 as build-deps
WORKDIR /usr/src/app
COPY packages/digitalweb/package.json packages/digitalweb/yarn.lock ./
RUN yarn
COPY . ./
RUN yarn build

FROM nginx:1.12-alpine
COPY --from=build-deps /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]