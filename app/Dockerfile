# Build Stage

FROM node:20-alpine AS build

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn build


# Production stage

FROM node:20-alpine

WORKDIR /app

RUN adduser -D -u 65532 nonroot && chown -R nonroot:nonroot /app

RUN yarn global add serve

COPY --from=build /app/build ./build
COPY --from=build /app/package.json ./
COPY --from=build /app/yarn.lock ./

USER nonroot

EXPOSE 3000

ENTRYPOINT ["serve", "-s", "build", "-l", "tcp://0.0.0.0:3000"]

