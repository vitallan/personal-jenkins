FROM jenkins

USER root

RUN wget http://ftp.us.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20141019+deb8u1_all.deb
RUN wget http://ftp.us.debian.org/debian/pool/main/a/apt/apt-transport-https_1.0.9.8.3_amd64.deb
RUN dpkg -i ca-certificates_20141019+deb8u1_all.deb
RUN dpkg -i apt-transport-https_1.0.9.8.3_amd64.deb
RUN touch /etc/apt/sources.list.d/docker.list
RUN echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

RUN wget https://deb.nodesource.com/setup_6.x
RUN bash setup_6.x

RUN apt-get update && apt-get install -y maven docker-engine nodejs sshpass
RUN wget https://github.com/spf13/hugo/releases/download/v0.17/hugo_0.17-64bit.deb
RUN dpkg -i hugo_0.17-64bit.deb
RUN npm install -g yo
RUN npm install -g bower
RUN npm install -g gulp-cli
RUN npm install -g generator-jhipster

VOLUME ["/var/run/docker.sock"]

