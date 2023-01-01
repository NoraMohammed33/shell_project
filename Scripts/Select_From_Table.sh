#!/bin/bash
select_record(){
    cd DB_engine/$DB_name
    echo -e "Enter Table name \n"
    read table_name
    if [ -f $table_name ]
    then
        select choice in "Select All Records" "Select Record By Primary Key" "Back To Connect To Database Menu"
        do
            case $choice in 
            "Select All Records" )
                if [[ $(sed '1,3d' $table_name | wc -l) -eq 0 ]]
                then 
                    echo -e "There are no records in the table "
                else
                    echo -e "Displaying all the records :\n"
                    sed '1,3d' $table_name
                fi
                ;;
            "Select Record By Primary Key" )
                echo -e "Entering the Primarykey value of the record you wanna display \n"
                read primary_key
                typeset -i pk_field=$primary+1
                if [[ $(sed '1,3d' $table_name | cut -d " " -f $pk_field | grep -x $primary_key | sed '1!d') ==  $primary_key ]]
                then
                    let selected_record=$(cut -d " " -f $pk_field $table_name | grep -n -x $primary_key | cut -d: -f1)
                    echo -e "\n\nThe Record : \n"
                    sed -n "${selected_record}p" "$table_name"
                else
                    echo -e "The primary key value doesn't match any \n"
                fi
                ;;
            "Back To Connect To Database Menu" )
                ./ConnectToDB.sh;;
            * )
            echo -e "Please , Choose From the above list \n";;
            esac
        done
    else
        echo -e "Table isn't exist\n"
    fi
}
select_record