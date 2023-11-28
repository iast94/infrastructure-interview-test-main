FROM node:alpine

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy source files
COPY . . 

# Start the app
EXPOSE 3000
CMD ["yarn", "start"]