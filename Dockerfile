# Use official Node.js image
FROM node:18

# Set working directory inside container
WORKDIR /app

# Copy package.json first (for dependency caching)
COPY package*.json ./

# Install dependencies (none here, but best practice)
RUN npm install

# Copy all files to container
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["npm", "start"]