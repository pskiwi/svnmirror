FROM ubuntu

MAINTAINER andreas.pillath@gmail.com

RUN apt-get update && apt-get install -y subversion

RUN mkdir /repo.temp /repo.temp/hooks /repo.temp/conf
COPY start-commit /repo.temp/hooks
COPY pre-revprop-change /repo.temp/hooks
COPY passwd /repo.temp/conf/

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh /repo.temp/hooks/start-commit /repo.temp/hooks/pre-revprop-change

VOLUME /repo

ENTRYPOINT ["/entrypoint.sh"]