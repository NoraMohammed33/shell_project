#!/bin/bash

#create the database_engine 
if [ ! -d ~/DB_engine ]
then
    mkdir ~/DB_engine
    echo -e "Your database server is made successfully\n "
    cd ~/DB_engine
else
    echo -e "Your database server is already exist\n"
    cd ~/DB_engine
fi
#after creation switching to Database Main Menu 
. ~/shell_project/Scripts/MainMenu.sh
