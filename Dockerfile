FROM node:20-alpine

WORKDIR /app

ENV HOST=0.0.0.0

COPY package.json package-lock.json* ./
RUN npm ci

COPY . .

EXPOSE 3000
CMD ["npm", "start"]
