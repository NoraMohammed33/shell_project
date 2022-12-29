if [ -d ./DB_engine ] ;then

    check=$(ls DB_engine | wc -l)
    list=$(ls DB_engine)
    if [[ $check != 0 ]] ;then
      for i in $list
        do
           echo $i
        done
       read -p "enter Database Name " name
       for i in $list
         do
          if [[ $i == $name ]] ;then
             rm -r DB_engine/$i
             echo "database deleted successfuly"
             ./MainMenu.sh    
          else
             echo "there is no database with this name"
             ./MainMenu.sh    
           fi      
         done
     else
      echo "Database engine has no databases"
      ./MainMenu.sh
     fi
else 
      echo "Database Engine isn't made yet for now "
          ./MainMenu.sh  
fi
     
