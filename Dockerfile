FROM centos:latest
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install nginx; yum clean all
RUN curl --silent --location https://rpm.nodesource.com/setup_9.x | bash -
RUN yum -y install nodejs; yum clean all
RUN yum -y install gcc-c++ openssl-devel make; yum clean all
RUN npm install -g express-generator
RUN npm install -g webpack
RUN npm install -g gulp
ADD uptick-master /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
RUN npm install
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
