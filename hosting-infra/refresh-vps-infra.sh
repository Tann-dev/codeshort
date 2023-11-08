#!/usr/bin/env bash

if [ -e /home/guillaume/hosting-infra/github_token ]
then
    source /home/guillaume/hosting-infra/github_token
    # file 'github_token' must contain 'export github_token=....'
    echo $(date -u) "github_token loaded"
else
    echo $(date -u) "github_token file not found"
fi

echo $(date -u) "Refresh git repository"
touch git-pull-last-run
git pull

echo $(date -u)  "Login to github"
docker login -u gjambet -p $github_token ghcr.io

echo $(date -u) "Refresh docker images"
docker-compose pull --include-deps

#echo $(date -u) "Backup DB"
#docker exec -t postgres-13 pg_dumpall -c > /home/guillaume/hosting-infra/postgres-dumps/`date +%d-%m-%Y"_"%H_%M_%S`.sql
#ls -l /home/guillaume/hosting-infra/postgres-dumps/

echo $(date -u) "Kill current containers"
docker-compose down --remove-orphans

#echo $(date -u) "Housekeeping : pruning images"
#docker image prune -f

#echo $(date -u) "Housekeeping : pruning volumes"
#docker volume prune -f

echo $(date -u) "Housekeeping : pruning networks"
docker network prune -f

echo $(date -u) "Refresh docker containers"
docker-compose up -d

echo $(date -u) "Script is over"
