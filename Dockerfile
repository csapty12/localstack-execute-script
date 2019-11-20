FROM alpine

RUN apk add --update python3
RUN apk add --update netcat-openbsd
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade --user awscli
RUN pip3 install --upgrade --user awscli-local
ENV PATH="$PATH:/root/.local/bin"
ADD schema.json /
ADD configure-dynamodb.sh /configure-dynamodb.sh
RUN /configure-dynamodb.sh
RUN awslocal dynamodb create-table --cli-input-json file:///schema.json
#CMD ["awslocal","dynamodb","list-tables"]

