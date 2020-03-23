FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt install -y \
    apache2 \
    mysql-server \
    php \
    libapache2-mod-php \
    php-mysql \
    php-xml \
    php-mbstring
ADD https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.0.tar.gz .
RUN tar -xvzf mediawiki-*.tar.gz
RUN mkdir /var/lib/mediawiki
RUN cp -a mediawiki-*/* /var/lib/mediawiki
RUN ln -s /var/lib/mediawiki /var/www/html/mediawiki
EXPOSE 80
CMD [ "apachectl", "-D", "FOREGROUND" ]