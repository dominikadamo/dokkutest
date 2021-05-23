FROM node:14 as build-deps
WORKDIR /usr/src/app
RUN yarn global add lerna
COPY packages/digitalweb/package.json packages/digitalweb/yarn.lock ./packages/digitalweb/
RUN ls
RUN pwd
RUN yarn
COPY . ./
RUN yarn build

FROM nginx:1.12-alpine
COPY --from=build-deps /usr/src/app/packages/digitalweb/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
