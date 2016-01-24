FROM ubuntu:trusty
MAINTAINER  <bjasko@bring.out.ba>


ENV DEBIAN_FRONTEND noninteractive
RUN \
  apt-get update && \
  apt-get install --no-install-recommends -y apache2 && \
  apt-get install --no-install-recommends -y git && \
  apt-get install --no-install-recommends -y nginx && \
  apt-get install --no-install-recommends -y python python-setuptools python-virtualenv python-dev gcc swig dialog libaugeas0 openssl libssl-dev libffi-dev ca-certificates && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN cd /opt &&  git clone https://github.com/letsencrypt/letsencrypt
RUN cd /opt/letsencrypt &&  ./letsencrypt-auto --help

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
