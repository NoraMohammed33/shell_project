#!/bin/bash

#create the database_engine 
if [ ! -d ./DB_engine ]
then
    mkdir ./DB_engine
     echo -e "Your database server is made successfully please select from menu again\n "
    cd DB_engine
    ../MainMenu.sh
else
    echo -e "Your database server is already exist\n"
    cd DB_engine
    ../MainMenu.sh
fi
#after creation switching to Database Main Menu 
