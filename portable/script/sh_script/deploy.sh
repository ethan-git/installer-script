#!/usr/bin/env bash

token=80ba01cf7aaaad23f539d6a6be09e5ad7adce359

output=$(curl --silent https://circleci.com/api/v1.1/project/github/ethan-git/sdq-b2en/latest/artifacts?circle-token=$token&branch=master&filter=successful | jq '.')

url=$(echo ${output} | jq -r '.[0].url')

echo $url

wget -O sdq.war $url?circle-token=$token

echo "##### download complete ####"

#rm -Rf /home/tomcat/sdq-postgresql/webapps/sdq*

#mv /home/tomcat/sdq/sdq.war /home/tomcat/sdq-postgresql/webapps/

#echo "#### server stop ####"
#/home/tomcat/sdq-postgresql/stop.sh

#echo "#### server start ####"
#/home/tomcat/sdq-postgresql/start.sh
