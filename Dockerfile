FROM node:alpine3.19

# Create app directory
WORKDIR /web

# Install app dependencies
COPY ./app/package.json ./app/yarn.lock ./
RUN yarn install

# Copy source files
COPY ./app/. . 

# Start the app
EXPOSE 3000
CMD ["yarn", "start"]
