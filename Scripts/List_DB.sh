#!/bin/bash
if [ -d ./DB_engine ] ;then

    echo "i'm in DataBase_engine "
    for i in `ls DB_engine `
    do
       echo $i
    done
    ./MainMenu.sh
else
   echo "Database Engine isn't made yet for now "
   ./MainMenu.sh
fi
  
