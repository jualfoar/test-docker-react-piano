FROM node:18-alpine
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build the React app
RUN npm run build

# Install serve to run the production build
RUN npm install -g serve

# Expose port
EXPOSE 3000

# Copy package.json from node_modules before starting
CMD sh -c "cp /app/node_modules/package.json /app/package.json 2>/dev/null || true && serve -s build -l 3000"
