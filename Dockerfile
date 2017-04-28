FROM ubuntu:16.04

MAINTAINER Tim Nederhoff <timnederhoff@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true


RUN apt-get update -y \
    && apt-get -y --no-install-recommends install openjdk-8-jre-headless wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/selenium && wget --no-check-certificate -O /opt/selenium/selenium-server-standalone.jar \
    "https://github.com/groupon/Selenium-Grid-Extras/releases/download/v1.12.12/SeleniumGridExtras-1.12.12-SNAPSHOT-jar-with-dependencies.jar"

ADD hub_4444.json /opt/selenium/hub_4444.json
ADD selenium_grid_extras_config.json /opt/selenium/selenium_grid_extras_config.json
ADD entry_point.sh /opt/bin/entry_point.sh

RUN chmod +x /opt/bin/entry_point.sh


EXPOSE 3000

WORKDIR /opt/selenium/

CMD ["/opt/bin/entry_point.sh"]