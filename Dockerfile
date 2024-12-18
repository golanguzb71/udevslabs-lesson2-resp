FROM node:latest AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --production
COPY . .
FROM node:slim
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app ./
EXPOSE 3000
CMD ["node", "app.js"]
