#!/bin/bash

/usr/local/bin/docker-compose build

echo -e "Built Docker Image"

/usr/local/bin/docker-compose start

echo -e "Brought up docker compose "

/usr/local/bin/docker-compose run web rake db:migrate

echo -e "DB Migration is complete"
