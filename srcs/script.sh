# !/bin/sh

mkdir -p /${HOME}/data
mkdir -p /${HOME}/data/wp-data
mkdir -p /${HOME}/data/db-data
mkdir -p /${HOME}/data/phpmyadmin-data

sed -i "s|DOMAIN_NAME=localhost|DOMAIN_NAME=$(hostname -I | awk  '{print $1}')|" /${HOME}/cloud-1/.env
