#!/bin/bash

/usr/local/bin/docker-compose stop

echo -e "Stopped existing docker compose instances"

/usr/local/bin/docker-compose build

echo -e "Built Docker Image"

/usr/local/bin/docker-compose up -d

echo -e "Brought up docker compose "

/usr/local/bin/docker-compose run web rake db:migrate

echo -e "DB Migration is complete"
