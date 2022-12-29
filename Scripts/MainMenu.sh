#!/bin/bash
#Database Main Menu
echo -e "Welcome To Database Main Menu \n"
select choice in "Create Database" "List Databases" "Connect To Databases" "Drop Database"
do
    case $choice in
    "Create Database" )
            ./CreateDB.sh ;;
    "List Databases" )
            ./List_DB.sh ;;
    "Connect To Databases" )
            ./ConnectToDB.sh ;;
                "Drop Database" )
            ./Drop_DB.sh ;;
            * )
                echo "Please , Choose From The Menu Items !";;
    esac
done


