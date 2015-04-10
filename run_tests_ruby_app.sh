#!/bin/bash

/usr/local/bin/docker-compose stop web

echo -e "Stopping web container only"

/usr/local/bin/docker-compose build

echo -e "Built Docker Image"

/usr/local/bin/docker-compose run -d web

echo -e "Brought up docker compose "

/usr/local/bin/docker-compose run web rake db:migrate

echo -e "DB Migration is complete"
