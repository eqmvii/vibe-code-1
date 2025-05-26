FROM node:18-alpine AS build

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Build the application
RUN npm run build

FROM nginx:alpine

# Copy the built files
COPY --from=build /app/dist /usr/share/nginx/html

# Set environment variables for Windows compatibility
ENV NGINX_PORT=8080

# Configure nginx
RUN echo "daemon off;" > /etc/nginx/nginx.conf
RUN echo "events { worker_connections 1024; }" >> /etc/nginx/nginx.conf
RUN echo "http {" >> /etc/nginx/nginx.conf
RUN echo "    server {" >> /etc/nginx/nginx.conf
RUN echo "        listen ${NGINX_PORT};" >> /etc/nginx/nginx.conf
RUN echo "        server_name localhost;" >> /etc/nginx/nginx.conf
RUN echo "        location / {" >> /etc/nginx/nginx.conf
RUN echo "            root   /usr/share/nginx/html;" >> /etc/nginx/nginx.conf
RUN echo "            index  index.html index.htm;" >> /etc/nginx/nginx.conf
RUN echo "        }" >> /etc/nginx/nginx.conf
RUN echo "    }" >> /etc/nginx/nginx.conf
RUN echo "}" >> /etc/nginx/nginx.conf

EXPOSE ${NGINX_PORT}
CMD ["nginx"]
