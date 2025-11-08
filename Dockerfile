FROM node:18-alpine as build
WORKDIR /app
COPY package* ./
RUN npm ci --only=production
COPY . .
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app /app
CMD ["npm","start"]
