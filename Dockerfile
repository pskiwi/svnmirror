FROM ubuntu

MAINTAINER andreas.pillath@gmail.com

RUN apt-get update && apt-get install -y subversion
RUN svnadmin create /repo

COPY start-commit /repo/hooks
COPY pre-revprop-change /repo/hooks
COPY passwd /repo/conf/
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh /repo/hooks/start-commit /repo/hooks/pre-revprop-change

VOLUME /repo

ENTRYPOINT ["/entrypoint.sh"]