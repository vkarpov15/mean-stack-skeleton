FROM node:latest

RUN apt-get update && apt-get install -y \
	npm \
	&& apt-get clean \
 	&& rm -rf /var/lib/apt/lists/*

COPY package.json /src/
RUN cd /src; npm install
COPY . /src/

RUN npm cache clean

EXPOSE  8080

CMD ["node", "/src/app.js"]