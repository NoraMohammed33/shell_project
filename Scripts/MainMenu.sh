#!/bin/bash
#Database Main Menu
echo -e "Welcome To Database Main Menu \n"
select choice in "Create Database" "List Databases" "Connect To Databases" "Drop Database"
do
    case $choice in
    "Create Database" )
            . ~/shell_project/Scripts/CreateDB.sh;;
    "List Databases" )
            . ~/shell_project/Scripts/List_DB.sh;;
    "Connect To Databases" )
            . ~/shell_project/Scripts/ConnectToDB.sh;;
    "Drop Database" )
            . ~/shell_project/Scripts/Drop_DB.sh;;
            * )
                echo "Please , Choose From The Menu Items !";;
    esac
done

