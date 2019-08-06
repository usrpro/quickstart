FROM debian:stretch-slim

RUN apt-get -y update \
    && apt-get -y install ca-certificates wget \
    && rm -rf /var/lib/apt/lists

RUN cd /usr/local/bin \
    && wget https://github.com/gohugoio/hugo/releases/download/v0.56.3/hugo_0.56.3_Linux-64bit.tar.gz \
    && tar -xvzf hugo_0.56.3_Linux-64bit.tar.gz \
    && rm -fv hugo_0.56.3_Linux-64bit.tar.gz
ADD ./ /project/
WORKDIR  /project

EXPOSE 80
CMD ["hugo", "server", "--bind", "0.0.0.0", "--port", "80"]
