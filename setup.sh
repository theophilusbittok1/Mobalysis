#!/bin/bash

sudo apt update

# Install postgres chosing 'yes' for all prompts if possible
sudo apt install -y postgresql postgresql-contrib

# Create Postgres User: mob_db_user with password mob_db_password
sudo -u postgres psql -c "CREATE USER mob_db_user;"
sudo -u postgres psql -c "ALTER USER mob_db_user password 'mob_db_pass';"

#add user
cd /home
useradd mob_app_usr

#
cd /home/mob_app_usr 
git clone https://github.com/theophilusbittok1/Mobalysis.git

# Install the 'python3-venv' package
sudo apt install python3-venv

# Create a postresql database with the name 'mobalytics'
sudo -u postgres psql -c "CREATE DATABASE mobalytics;"

# Set the owner of the database to 'mob_db_user'
sudo -u postgres psql -c "ALTER DATABASE mobalytics OWNER TO mob_db_user;"
