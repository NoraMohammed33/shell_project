#!/bin/bash
connect_DB(){
    cd DB_engine/$DB_name
    echo -e "Welcome To $DB_name Database \n"
    select table in "Create Table" "List Tables" "Drop Table" "Insert To Table" "Select From Table" "Delete From Table" "Back To Main Menu"
    do 
        case $table in 
        "Create Table" )
         ./Create_Table.sh;;
         "List Tables" )
         ./List_Tables.sh;;
         "Drop Table" )
         ./Drop_Table.sh;;
         "Insert To Table" )
         ./Insert_To_Table.sh;;
         "Select From Table" )
         ./Select_From_Table.sh;;
         "Delete From Table" )
         ./Delete_From_Table.sh;;
         "Back To Main Menu" )
         ../MainMenu.sh;;
         * )
            echo -e "Please Choose From The Upper Menu \n"
        esac
    done
}
if [ ! -d ./DB_engine ]
then 
    echo -e "Database Engine isn't made yet for now "
    ./MainMenu.sh
else
    cd DB_engine
    arr=($(ls))
    list=`ls -d * `
    if [ ${#arr[@]} -gt 0 ]
    then 
        echo -e "Databases in This Server : \n"
        for i in $list 
        do 
            echo $i 
        done
        echo -e "Write Down The Database You Want To Connect Into \n"
        read DB_name
        if [ ! -d $DB_name ]
        then
            echo -e "This Database Isn't Exist \n"
            echo -e "Switching You To The Main Menu \n"
            ../MainMenu.sh
        else
         connect_DB
        fi
    else
        echo -e "Database Server is Empty \n"
        echo -e "Switching you To The Main Menu"
        ../MainMenu.sh
    fi
fi


