FROM ubuntu:18.04


ENV DOMAINNAME=some.domain
ENV ACMEEMAIL=devops@some.domain

# install base deps and stuff
RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN apt-get update -y
RUN apt install -y nginx 
# install certbot
RUN add-apt-repository ppa:certbot/certbot
RUN apt-get update -y
RUN apt-get install -y certbot

# expose ports
EXPOSE 80 443 22

# cert stuff for frontend
ADD fullchain.pem /etc/letsencrypt/live/frontend/fullchain.pem
ADD private.pem /etc/letsencrypt/live/frontend/private.pem

# work dir
WORKDIR /etc

# add entrypoing
ADD docker-entrypoint.sh .

# make certs dir as volume
VOLUME ["/etc/letsencrypt"]

CMD ["/etc/docker-entrypoint.sh"]
