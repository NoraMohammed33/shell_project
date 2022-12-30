#!/bin/bash 
cd DB_engine/$DB_name      
tables_DB=($(ls))
if [ ${#tables_DB[@]} -gt 0 ]
then
    echo -e "All Tables in this database : \n"
    for i in $(ls *)
    do
         echo $i
    done
    echo -e "Enter the table you want to delete \n"
    read table_name
    if [ -f $table_name ]
    then 
         rm $table_name
         echo -e "Table is deleted successfully \n"
         cd -
         ./Table_menu.sh
     else
         echo -e "This table isn't exist \n "
          cd -
         ./Table_menu.sh
    fi
    
else
    echo -e "This database is already empty"
     cd -
    ./Table_menu.sh
fi
           
