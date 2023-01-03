cd DB_engine/$DB_name
echo -e "Enter Table name \n"
read table_name
if [ -f $table_name ]
then
update_table()
{
        primary=`sed -n '1p' $table_name`
        declare -a cols=($(sed -n '2p' $table_name))
        echo ${cols[1]}
        declare -a datatype=$(sed -n '3p' $table_name)
        echo "enter col youn need to update"
        read col_name
        check_col=$(awk '
        BEGIN{
            FS=" "}
        {
            if(NR==2){for(i=1;i<=NF;i++){if($i=="'$col_name'") print i}}
            }
        ' $table_name)
        if [[ $check_col == "" ]]
        then
            echo -e "Column Not Found \n"
        else 
            declare -i num 
            echo -e "Enter the primary key value of the record you want to Update it \n "
            read primary_key
            typeset -i pk_field=$primary+1
            if [[ $(sed '1,3d' $table_name | cut -d " " -f $pk_field | grep -x $primary_key | sed '1!d') ==  $primary_key ]]
                then
                for i in "${!cols[@]}";
                do
                    if [[ ${cols[i]} == $col_name ]]
                    then
                       declare -i num=$i
                        num+=1
                        #echo $num
                    fi
                    if [[ ${cols[i]} == ${cols[$primary]} ]]
                    then
                        declare -i numpk=$i
                        numpk+=1
                       # echo $numpk
                    fi
                done
                 echo -e "Enter the new value \n "
                read newval
                samer=`awk -v pk="$primary_key" -v nk="$numpk" '
                BEGIN{i=0;
                    }
                    {
                        while(i< NR)
                        {
                        if($nk== pk)
                          {
                            print NR
                          }
                          i++
                          }
                      }
                 ' $table_name`
                 echo $samer

                nnn=$(awk -v nrr="$samer" -v coln="$num" -v nv="$newval" -F" " '
                    BEGIN{
                        i=0;
                        }
                        
                        {
                            while(i< NR)
                            {
                            if(NR == nrr)
                            {
                              $coln=nv
                            }
                            i++
                            }
                        print $0 
                        }
                    ' $table_name)
                #echo "${nnn[@]}"
                cat /dev/null >$table_name
                echo -e "${nnn[@]}" >> $table_name
               # echo "uuuuuuuuuu"

            fi

        fi
}
update_table   # Running the function 
echo -e "Update is done successfully"
cd -
else
    echo -e "There is no table with this name \n"
    cd -
fi