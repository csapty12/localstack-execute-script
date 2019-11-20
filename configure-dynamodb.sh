#! /bin/sh
export http_proxy=
export HTTP_PROXY=
echo 'Waiting for DynamoDB to Start...'
while ! nc -z dynamodb 4569; do echo 'waiting for 4569...'; sleep 1; done ;