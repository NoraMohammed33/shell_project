#!/bin/bash
if [ -d ~/DB_engine] ;then

    cd ~/DB_engine
    echo "i'm in DataBase_engine "
    for i in `ls -d`
    do
       echo $i
    done
    . ~/shell_project/scripts/MainMenu.sh
else
   echo "Database engine has no databases"
   . ~/shell_project/scripts/MainMenu.sh
fi
  