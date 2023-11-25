FROM node:alpine

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy source files
COPY . . 

# run
EXPOSE 3000
CMD ["yarn", "typeorm", "migration:run"]
CMD ["yarn", "start"] 