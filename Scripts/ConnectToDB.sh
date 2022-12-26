#!/bin/bash
connect_DB(){
    cd ~/DB_engine/$DB_name
    echo -e "Welcome To $DB_name Database \n"
    select table in "Create Table" "List Tables" "Drop Table" "Insert To Table" "Select From Table" "Delete From Table" "Back To Main Menu"
    do 
        case $table in 
        "Create Table" )
         . ~/shell_project/Scripts/Create_Table.sh;;
         "List Tables" )
         . ~/shell_project/Scripts/List_Tables.sh;;
         "Drop Table" )
         . ~/shell_project/Scripts/Drop_Table.sh;;
         "Insert To Table" )
         . ~/shell_project/Scripts/Insert_To_Table.sh;;
         "Select From Table" )
         . ~/shell_project/Scripts/Select_From_Table.sh;;
         "Delete From Table" )
         . ~/shell_project/Scripts/Delete_From_Table.sh;;
         "Back To Main Menu" )
         . ~/shell_project/Scripts/MainMenu.sh;;
         * )
            echo -e "Please Choose From The Menu \n"
        esac
    done
}
if [ ! -d ~/DB_engine ]
then 
    echo -e "Database Engine isn't made yet"
    . ~/shell_project/Scripts/DBEngine-creation.sh
else
    cd ~/DB_engine
    arr=($(ls))
    list=`ls -d * `
    if [ ${#arr[@]} -gt 0 ]
    then 
        echo -e "Databases in This Server : \n"
        for i in $list 
        do 
            echo $i 
        done
        echo -e "Write The Name Of The Database You Want To Connect To \n"
        read DB_name
        if [ ! -d $DB_name ]
        then
            echo -e "The Database Doesn't Exist \n"
            echo -e "Switch To Main Menu \n"
            . ~/shell_project/Scripts/MainMenu.sh
        else
         connect_DB
        fi
    else
        echo -e "Database Server is Empty \n"
        echo -e "Switch To Main Menu"
        . ~/shell_project/Scripts/MainMenu.sh
    fi
fi


