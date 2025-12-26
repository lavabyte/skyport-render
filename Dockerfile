FROM ubuntu:24.04
RUN apt-get update && apt-get install -y curl libatomic1 git && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && apt install nodejs -y
RUN git clone https://github.com/lavabyte/skyport-panel /app
WORKDIR /app
RUN npm install && mv example_config.json config.json && npm run seed && npm run createUser --username=admin --email=admin@example.com --password=1234
EXPOSE 3000
CMD node .
