FROM ubuntu:24.04
RUN apt-get update && apt-get install -y \
    shellinabox bash curl wget ca-certificates python3 nano \
    && rm -rf /var/lib/apt/lists/* && echo "root:1234" | chpasswd
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && apt install nodejs libatomic1 git -y
RUN git clone https://github.com/lavabyte/skyport-panel /app
WORKDIR /app
RUN npm install && mv example_config.json config.json && npm run seed && npm run createUser --username=admin --email=admin@example.com --password=1234
EXPOSE 3000
CMD node .
