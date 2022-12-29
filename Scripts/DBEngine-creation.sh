#!/bin/bash

#create the database_engine 
if [ ! -d ./DB_engine ]
then
    mkdir ./DB_engine
     echo -e "Your database server is made successfully please select from menu again\n "

    ./MainMenu.sh
else
    echo -e "Your database server is already exist\n"
    ./MainMenu.sh
fi
#after creation switching to Database Main Menu 
