#!/bin/bash       
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
         ./Table_menu.sh
     else
         echo -e "This table isn't exist \n "
         ./Table_menu.sh
    fi
else
    echo -e "This database is already empty"
    ./Table_menu.sh
fi
           
