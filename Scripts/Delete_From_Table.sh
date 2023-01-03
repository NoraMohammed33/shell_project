#!/bin/bash

delete_record()
{
    cd DB_engine/$DB_name
    echo -e "Enter Table name \n"
    read table_name
    if [ -f $table_name ]
        then
        select choice in "Delete All Records" "Delete Record By Primary Key" "Back To Table Menu"
            do
                case $choice in 
                "Delete All Records" )
                   cat /dev/null >$table_name
                        cd - 
                        ./Table_menu.sh
                    ;;
                "Delete Record By Primary Key" )

                primary=`sed -n '1p' $table_name`
                echo $primary
                    echo -e "Enter the primary key value of the record you want to delete it \n "
                    read primary_key
                    typeset -i pk_field=$primary+1
                    if [[ $(sed '1,3d' $table_name | cut -d " " -f $pk_field | grep -x $primary_key | sed '1!d') ==  $primary_key ]]
                    
                    then
                        let deleted_record=$(cut -d " " -f$pk_field $table_name | grep -n -x $primary_key | cut -d: -f1)
                        sed -i "${deleted_record}d" "$table_name"
                        echo -e "The record is deleted successfully \n"
                        cd -
                        ./Table_menu.sh
                    else
                        echo -e "The primary key value doesn't match any \n"
                        delete_record
                    fi
                    ;;
                    "Back To Table Menu" )
                    cd -
                    ./Table_menu.sh
                    ;;
                esac
            done
    else
        echo -e "There's no table with this name  \n"
        cd -
             ./Table_menu.sh
    fi
}
delete_record
