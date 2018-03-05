#!/bin/bash

echo "Input param: $1"

echo "Current working directory.."
pwd

echo "Removing war file in docker directory"
rm src/main/docker/endpoints-1.0-SNAPSHOT.war

sed "s/<index>/$1/g" TemplateEchoServlet.java > src/main/java/com/example/endpoints/EchoServlet.java

echo "Build new war file"
mvn clean
mvn package

echo "Copy new war file to docker directory"
cp target/endpoints-1.0-SNAPSHOT.war src/main/docker/

echo "Build and tag docker image"
cd src/main/docker
docker build -t gcr.io/tvlk-nlp/echo-$1-java:0.0.1 .
cd -

gcloud docker -- push gcr.io/tvlk-nlp/echo-$1-java:0.0.1

