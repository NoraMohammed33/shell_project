#!/bin/bash
#Database Main Menu
echo -e "Welcome To Database Main Menu \n"
select choice in "Create Database" "List Databases" "Connect To Databases" "Drop Database"
do
    case $choice in
    "Create Database" )
            . ~/Bash-Project/Scripts/CreateDB.sh;;
    "List Databases" )
            . ~/Bash-Project/Scripts/List_DB.sh;;
    "Connect To Databases" )
            . ~/Bash-Project/Scripts/ConnectToDB.sh;;
    "Drop Database" )
            . ~/Bash-Project/Scripts/Drop_DB.sh;;
            * )
                echo "Please , Choose From The Menu Items !";;
    esac
done

