# Create app builder
FROM node:21.5.0-alpine3.19 as builder

# Create app directory
WORKDIR /web

# Copy just the dependency files and configs needed for install
COPY ./app/package.json ./app/yarn.lock ./

# Install app dependencies with yarn
RUN yarn install

# Copy source files
COPY ./app/. . 

# build the app
RUN yarn build


# MULTI-STAGE BUILD
FROM node:21.5.0-alpine3.19 as final

# Create app directory
WORKDIR /web

# copy build from previous stage
COPY --from=builder /web/dist .
COPY ./app/package.json ./app/yarn.lock ./

# Start the app
RUN yarn install --production
EXPOSE 3000
CMD [ "yarn", "start" ]
