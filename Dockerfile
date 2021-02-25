FROM ubuntu:18.04

##
#
# Envorment Vars
#
##
ENV SUDOKUFLASK_SECRET_KEY="super secrety secret"


##
#
#  Get apache, python, flask, and modwsgi
#
##
RUN apt-get update --fix-missing && apt-get install -y
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2
RUN apt-get install -y python3-pip python-dev build-essential
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt
RUN rm /tmp/requirements.txt
RUN apt-get install libapache2-mod-wsgi-py3 -y

##
#
#  Configure apache
#
##
COPY my-apache2.conf /etc/apache2/apache2.conf
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY ports.conf /etc/apache2/ports.conf

##
#
#  Add the app to /srv/ and configure
#
##
COPY app.tar /srv/app.tar
WORKDIR /srv
RUN tar -xf app.tar
RUN rm app.tar
RUN chmod +x sudokusolver
RUN chmod +rw kekw.osf

##
#
#  Run apache
#
##
CMD /usr/sbin/apache2ctl -D FOREGROUND
