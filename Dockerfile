# FROM debian:7.7
FROM debian:8.3

MAINTAINER Marco Zocca, zocca.marco gmail

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# # debian 7 "wheezy"
# RUN echo "deb \"https://apt.dockerproject.org/repo\" debian-wheezy main" >> /etc/apt/sources.list.d/docker.list 

# # debian 8 "jessie"
RUN echo "deb \"https://apt.dockerproject.org/repo\" debian-jessie main" >> /etc/apt/sources.list.d/docker.list 
RUN cat /etc/apt/sources.list.d/docker.list

RUN apt-get update
RUN apt-cache policy docker-engine
RUN apt-get update
RUN apt-get install -y docker-engine

RUN service docker start && docker run hello-world

RUN groupadd docker
RUN gpasswd -a ${USER} docker

# RUN service docker restart