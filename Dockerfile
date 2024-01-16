# stage 1: Compile and Build angular Codebase
FROM node:latest as build

# Install necessary dependencies
WORKDIR /usr/local/app
COPY ./  /usr/local/app/
RUN npm install
RUN npm run build

# Stage 2: Use the second image as the final image
FROM nginx:latest

# Copy files or artifacts from the previous stage
COPY --from=build /usr/local/app/dist/  /usr/share/nginx/html

EXPOSE 80
