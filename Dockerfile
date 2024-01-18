# Use the official Node.js image as the base image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI and project dependencies
RUN  npm install

# Copy the entire application to the working directory
COPY . .

# Build the Angular app
RUN npm run build 

# Expose port 80 for the application
EXPOSE 80

# Command to run the application
CMD ["nginx", "-g", "daemon off;"]
