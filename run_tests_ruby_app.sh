#!/bin/bash

/usr/local/bin/docker-compose stop

echo -e "Stopped existing docker compose instances"

tar -cvzf dbdata.tar /dbdata

echo -e  "Took backup of existing data"

/usr/local/bin/docker-compose build

echo -e "Built Docker Image"

/usr/local/bin/docker-compose up -d

echo -e "Brought up docker compose "

setopt RMSTARSILENT

rm -i -rf /dbdata/*

unsetopt RMSTARSILENT

echo -e "removed all files in mounted volume"

tar -xvf dbdata.tar /dbdata

echo -e "Restored the entire database"

/usr/local/bin/docker-compose run web rake db:migrate

echo -e "DB Migration is complete"
