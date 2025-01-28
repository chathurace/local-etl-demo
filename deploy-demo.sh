#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
    docker pull --platform linux/amd64  ballerina/jvm-runtime:2.0
    export DOCKER_BUILDKIT=0
fi

echo "===================================="
echo "       Building apps"
echo "===================================="

cd bal/crm_app
bal build --cloud=docker
cd - > /dev/null

cd bal/dataview
bal build --cloud=docker
cd - > /dev/null

cd bal/std
bal build --cloud=docker
cd - > /dev/null

cd mi/GlobalMart
mvn clean package -Pdocker
cd - > /dev/null

echo "===================================="
echo "       Deploying the ETL flow"
echo "===================================="

docker-compose up

echo "===================================="
echo "       ETL flow is ready"
echo "===================================="

