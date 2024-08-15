#!/bin/bash

# 깃 계정 토큰
github_token="ghp_k22q1I93sdasdirchgpIwpGBO4AMwsCC0taeq4AaF7K"

# 도커 네트워크 이름 설정
NETWORK_NAME="project_network"

# Git clone 명령어 실행
sudo git clone -b dev https://$github_token@github.com/ffoxentertainment/project_backend.git

# 이전 Docker 컨테이너 중지 및 삭제
sudo docker-compose --env-file development.env down

# 이전 Docker 미사용 이미지 삭제
sudo docker image prune -f

# 컨테이너 중 중지 상태인 컨테이너만 정리하기
sudo docker container prune -f

# 도커 이미지, 컨테이너, 볼륨, 네트워크 등 모든 도커 리소스 일괄 삭제
docker system prune -f


# git clone 명령어의 실행 상태 확인
if [ $? -eq 0 ]; then
  echo "Git clone successful!"
else
  echo "Git clone failed. Please check the repository URL, username, and password and try again."
fi

docker-compose --env-file development.env down

# 네트워크 확인 및 생성
if [[ $(docker network ls -f "name=$NETWORK_NAME" --format '{{.Name}}') != $NETWORK_NAME ]]; then
  echo "Creating Docker network: $NETWORK_NAME"
  docker network create $NETWORK_NAME
fi

docker-compose --env-file development.env up -d --build
