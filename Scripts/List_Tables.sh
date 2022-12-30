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
else
    echo -e "This database is empty \n"
    cd -
     ./Table_menu.sh
fi
