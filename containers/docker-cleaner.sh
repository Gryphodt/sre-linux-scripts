#!/bin/bash
echo "== Docker Cleanup =="
docker container prune -f
docker image prune -f
read -p "Remove unused volumes? (y/N): " -n 1 -r
echo
[[ $REPLY =~ ^[Yy]$ ]] && docker volume prune -f
docker system df
