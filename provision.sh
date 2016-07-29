#!/usr/bin/env bash

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

apt-get update
apt-get install -y git 
apt-get install -y python-pip 
apt-get install -y libpq-dev
apt-get install -y python-dev
apt-get install -y python-virtualenv
# apt-get install -y mysql-server mysql-client libmysqlclient-dev
# apt-get install -y postgresql
# apt-get install -y postgresql-contrib
# apt-get install -y rabbitmq-server
apt-get install -y libffi-dev
apt-get install -y libssl-dev
# Specific requirements for PIL. Comment if not necessary.
apt-get install -y libpng-dev libgif-dev libjpeg-dev libtiff-dev
apt-get install -y memcached
apt-get install -y gettext

apt-get install -y vim
apt-get install -y g++
apt-get install -y ruby1.9.1
# apt-get install -y mysql-server
# echo yunmengyanjin
# echo yunmengyanjin
apt-get install -y mysql-client libmysqlclient-dev
pip install mysql-python
pip install flake8

# Configure PostgreSQL
# Check if database exsits
# if ! sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -w lintcode; then
# sudo -u postgres psql << EOF
#     CREATE DATABASE lintcode;
#     CREATE USER lintcode WITH PASSWORD 'beatleetcode@2014';
#     ALTER USER lintcode CREATEDB;
#     GRANT ALL PRIVILEGES ON DATABASE lintcode TO lintcode;
# EOF
# fi

# cd /home/vagrant/LintCode/config
# cp local_settings.py.example local_settings.py

if ! [ -L /home/vagrant/website ]; then
  ln -fs /vagrant /home/vagrant/website
fi

# cd /home/vagrant/LintCode
# pip install -r requirements.txt

# cd /home/vagrant/LintCode
# psql -h localhost -p '' -U lintcode< lintcode_test.sql <<EOF
# beatleetcode@2014
# EOF

# sync database, please exec them in vm
# python manage.py syncdb
# python manage.py makemigrations
# python manage.py migrate
# python manage.py runserver
