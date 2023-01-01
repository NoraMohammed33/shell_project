#!/bin/bash
cd DB_engine/$DB_name
echo -e "Enter table name \n"
read table_name
if [ -f $table_name ]
then
            
        insert_to(){
            primary=`sed -n '1p' $table_name`
            declare -a cols=($(sed -n '2p' $table_name))
            
            declare -a datatype=$(sed -n '3p' $table_name)
            
            # echo $primary
            # echo ${cols[@]}
            # echo ${datatype[@]}
            len_cols=${#cols[@]} # number of columns in the table 
            #echo $len_cols
            echo -e "Insert the value of the row , Note ( the valid datatypes are integer and string ) \n"
            read -a record
           
            typeset -i i=0
            while [ $i -lt $len_cols ]  
            do
            arr=()
            read -a arr <<< "$datatype"
                if [[ ${arr[i]} == "int" ]]
                then
                    if ! [[ ${record[i]} =~ ^[0-9]+$ ]]

                    then
                        echo -e "There is something wrong with your input , it should include integer value \n"
                        insert_to
                    else
                 
                        
                        if [ $i == $primary ] 
                        then
                            typeset -i pk_field=$i+1
                            
                            if [[ $(sed '1,2d' $table_name | cut -d " " -f $pk_field | grep -x ${record[i]} | sed '1!d') == ${record[i]} ]]
                            then
                                echo -e "Primary Key value is already exist \n"
                              
                                insert_to
                            fi
                        fi
                    fi
                elif [[ ${arr[i]} == "string" ]]
                then
                    if ! [[ ${record[i]} =~ ^[a-zA-Z]+$ ]]
                    then
                        echo -e "There is something wrong with your input , it should include string value\n"
                        insert_to
                    else
                        if [ $i -eq $primary ]
                        then
                            typeset -i pk_field=$i+1
                            if [[ $(sed '1,7d' $table_name | cut -d " " -f $pk_field | grep -x ${record[i]} | sed '1!d') == ${record[i]} ]]
                            then
                                echo -e "Primary Key value is already exist \n"
                               
                                insert_to
                            fi
                        fi
                    fi
                else
                    echo -e "Insert again , There's a Problem ! \n"
                    insert_to
                fi
                i=$i+1
            done    
        }
        insert_to   # Running the function 
        echo -e "${record[@]}" >> $table_name #append the record into the table 
        echo -e "Insertion is done successfully"
        cd -
else
    echo -e "There is no table with this name \n"
    cd -
fi


