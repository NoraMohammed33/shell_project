#!/bin/bash
#function for creating the database directory but first we check if the engine is already made or not
create_DB(){
    mkdir $DB_name
    echo -e "Your Database is created Successfully \n"
}
if [ ! -d ~/DB_engine ]
then 
    echo -e "Database Engine isn't made yet"
    . ~/shell_project/Scripts/DBEngine-creation.sh
else
    cd ~/DB_engine 
    echo -e "Enter the name of database \n"
    read DB_name
    if [ -d $DB_name ]
    then 
        echo -e "This Database Name is already made , Please Check the Database List  \n"
        . ~/shell_project/Scripts/MainMenu.sh
    else
        create_DB
        echo -e "Switch To Main Menu\n"
        . ~/shell_project/Scripts/MainMenu.sh
    fi
fi

