FROM ubuntu/nginx

RUN apt-get update
RUN apt-get install nano

RUN mkdir -p /etc/ssl

ADD ./nginx/certs/site1-cert.pem /etc/ssl
ADD ./nginx/certs/site1-key.pem /etc/ssl
ADD ./nginx/site1.com /etc/nginx/sites-available

ADD ./nginx/certs/site2-cert.pem /etc/ssl
ADD ./nginx/certs/site2-key.pem /etc/ssl
ADD ./nginx/site2.com /etc/nginx/sites-available

WORKDIR /etc/nginx/sites-enabled

RUN rm default

RUN ln -s ../sites-available/site1.com .

RUN ln -s ../sites-available/site2.com .

RUN mkdir -p /var/www/html
