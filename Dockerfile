FROM python:3.9-slim

WORKDIR /usr/src/app

RUN sed -i 's|deb.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources \
    && sed -i 's|security.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources \
    && apt-get update \
    && apt-get install -y ffmpeg wget dnsutils\
    && rm -rf /var/lib/apt/lists/*

RUN wget https://mirror.ghproxy.com/https://raw.githubusercontent.com/fichenx/httpRandomMusic/main/httpRandomMusic.py

EXPOSE 65533

CMD ["python", "httpRandomMusic.py"]

