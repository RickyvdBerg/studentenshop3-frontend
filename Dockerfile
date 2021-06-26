
# stage 1

FROM node:alpine AS studentenshop3
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=studentenshop3 /app/dist/studentenshop3 /usr/share/nginx/html
EXPOSE 80