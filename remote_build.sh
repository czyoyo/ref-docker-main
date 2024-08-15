#!/bin/bash

# 도커 네트워크 이름 설정
NETWORK_NAME="project_network"

# 이전 Docker 컨테이너 중지 및 삭제
sudo docker-compose --env-file development.env down

# 컨테이너 중 중지 상태인 컨테이너만 정리하기 ( 실 서버X )
sudo docker container prune -f

# 이전 Docker 미사용 이미지 삭제 ( 실 서버X )
sudo docker image prune -f

# system prune ( 실 서버X )
sudo docker system prune -f


# 네트워크 확인 및 생성
if [[ $(docker network ls -f "name=$NETWORK_NAME" --format '{{.Name}}') != $NETWORK_NAME ]]; then
  echo "Creating Docker network: $NETWORK_NAME"
  docker network create $NETWORK_NAME
fi

sudo docker-compose --env-file development.env up -d --build



