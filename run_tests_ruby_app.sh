#!/bin/bash

pg_dump -c -h localhost -p 49153 -U postgres > backup.sql

echo -e "Take backup of the entire database"

/usr/local/bin/docker-compose stop

echo -e "Stopped existing docker compose instances"

echo -e  "Took backup of existing data"

/usr/local/bin/docker-compose build

echo -e "Built Docker Image"

/usr/local/bin/docker-compose up -d

echo -e "Brought up docker compose "

psql -h localhost -p 49153 -U postgres < backup.sql

echo -e "Restoring entire db now"

/usr/local/bin/docker-compose run web rake db:migrate

echo -e "DB Migration is complete"
