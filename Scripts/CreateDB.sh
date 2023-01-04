#!/bin/bash
#function for creating the database directory but first we check if the engine is already made or not
create_DB(){
    mkdir DB_engine/$DB_name
    echo -e "Your Database is created Successfully \n"
}
if [ ! -d ./DB_engine ]
then 
    echo -e "Database Engine isn't made yet for now "
    ./DBEngine-creation.sh
else

    echo -e "Enter the name of database \n"
    read DB_name
    if [[ ! $DB_name =~ ^[a-zA-Z]+$ ]]
    then
        echo -e "Enter a valid name (string only)"
         ./MainMenu.sh
    else
        if [[ -d DB_engine/$DB_name ]]
        then 
            echo -e "This Database Name is already made , Please Check the Database List  \n"
            ./MainMenu.sh
        else
            create_DB
            echo -e "Switch To Main Menu\n"
            ./MainMenu.sh
        fi
    fi
fi

