#!/bin/bash
if [ -d ./DB_engine ] ;then
    echo "i'm in DataBase_engine " 
    check=$(ls DB_engine | wc -l)
    if [[ $check != 0 ]] ;then

      for i in `ls DB_engine` 
        do
           echo $i
        done
      ./MainMenu.sh
    else 
     echo "Databases aren't made yet for now "
    ./MainMenu.sh
    fi
else
   echo "Database Engine isn't made yet for now "
   ./MainMenu.sh
fi
  
