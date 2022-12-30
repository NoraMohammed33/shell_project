#!/bin/bash
create_table()
{   
    cd DB_engine/$DB_name
    touch ./$table_names
    #touch /home/noor/nooor.txt
    echo -e "Enter Columns you wanna be in the table (seperated by space)\n"
    read -a cols
    len_cols=${#cols[@]}
    typeset datatype[$len_cols]
    typeset -i var=0
    while [ $var -lt $len_cols ]
    do
        echo -e "Determine the datatype of this column (${cols[$var]}) : \n"
        select type in "int" "string"
        do 
            case $type in 
                "int" )
                        datatype[$var]="int"
                        break;
                        ;;
                "string" )
                        datatype[$var]="string"
                        break;
                        ;;
                * )
                        echo -e "Please enter the datatype fo this column \n"
            esac
        done
        var=$var+1
    done

prim_key(){
        while true
        do
            echo -e "Table Columns : ${cols[@]}\n"
            echo -e "Enter your the column index you want to give primary key constraint \n"
            read primary
            if [[ $primary =~ ^[0-9]+$ ]]
            then
                if [ $primary -lt $len_cols ]
                then
                    echo -e "The column index which have the primary key constraint :" >> $table_name #1
                    echo $primary >>$table_name #2
                    break;
                else
                    echo -e "Out of range of index columns"
                    prim_key
                fi
            else
                echo -e "column index you put , not an integer \n "
                prim_key
            fi
        done
    }
    prim_key
    echo -e " Table Columns :" >> $table_name #3
    echo ${cols[@]} >> $table_name #4 
    echo -e "The data types of each column : " >> $table_name #5
    echo ${datatype[@]}>> $table_name #6
    echo -e "Note -> (int for integer number and string for string datatype )  " >>$table_name #7   
    echo -e "Your Table is Created Successfully \n"
    cd -
    ./Table_menu.sh
    
    
}

       
echo -e "Enter the name of the table \n"
read table_name
if [[ $table_name =~ ^[a-zA-Z]+$ ]]
then 
    if [ -f $table_name ]
    then 
         echo -e "Table name is already exist \n"
         echo -e "Switching you back to  Table menu \n"
         ./Table_menu.sh
    else
        create_table
     fi
else
    echo -e "The table name must be String Only \n"
    create_table
fi    
       


