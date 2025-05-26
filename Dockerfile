FROM node:18-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Start the preview server
EXPOSE 8080
CMD ["npm", "run", "preview", "--", "--port", "8080"]
