FROM nodesource/trusty:5.3.0

ADD package.json /opt/app/package.json
RUN cd /opt/app && npm install

ADD . /opt/app
WORKDIR /opt/app

ENV PORT 3000
EXPOSE 3000

CMD npm start
