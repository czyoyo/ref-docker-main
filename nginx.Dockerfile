FROM nginx:1.25.3

# 리액트 앱 소스 추가
COPY ./react/public /app/react/public

# install ping utility
RUN apt-get update && \
    apt-get install -y iputils-ping net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# 생략시 들어갈 포트
EXPOSE 80 443
