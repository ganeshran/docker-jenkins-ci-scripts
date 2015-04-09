#!/bin/bash

/usr/local/bin/docker-compose stop

echo -e "Stopped existing docker compose instances"

tar -cvzf dbdata.tar /dbdata

echo -e  "Took backup of existing data"

/usr/local/bin/docker-compose build

echo -e "Built Docker Image"

/usr/local/bin/docker-compose up -d

echo -e "Brought up docker compose "

rm -i -rf /dbdata/*

echo -e "removed all files in mounted volume"

tar -xf dbdata.tar -C /dbdata

echo -e "Restored the entire database"

/usr/local/bin/docker-compose run web rake db:migrate

echo -e "DB Migration is complete"
