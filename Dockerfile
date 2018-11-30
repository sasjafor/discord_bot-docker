FROM node

# Copy run script
COPY src/run.sh /usr/src/

# Copy package.json
COPY package.json /usr/src/app/

# Setup apt and create /config
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get update && \
    mkdir /config

# Install dependencies
RUN cd /usr/src/app && \
    npm install --save-prod

# Copy bot script file
COPY src/bot.js /usr/src/app/

EXPOSE 8080
VOLUME /config
CMD ["/usr/src/run.sh"]
