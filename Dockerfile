# Use Node.js LTS version
FROM node:lts-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package.json ./
RUN npm install

# Copy app source
COPY . .

# Expose port and start app
EXPOSE 3000
CMD ["npm", "start"]
