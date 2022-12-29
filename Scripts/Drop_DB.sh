if [ -d ./DB_engine] ;then

    cd DB_engine
    read -p "enter Database Name " name

    for i in `ls -d`
    do
       if($i ==$name)
          rm -r $i
          echo "database deleted successfuly"
          ./MainMenu.sh            
       else
          echo "there is no database with this name"
          ../MainMenu.sh  
    done
    
else
   echo "Database engine has no databases"
   ./MainMenu.sh
fi
