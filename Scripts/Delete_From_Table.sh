#!/bin/bash

delete_record()
{
    cd DB_engine/$DB_name
    echo -e "Enter Table name \n"
    read table_name
    if [ -f $table_name ]
    then
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
             
        else
            echo -e "The primary key value doesn't match any \n"
            delete_record
        fi
    else
        echo -e "There's no table with this name  \n"
    fi
}
delete_record