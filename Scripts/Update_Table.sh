function updateTable {
    echo "enter table name"
    read table_name
    if [ ! -f $table_name ]
    then
    echo "table may not exists"
    ./Table_menu.sh
    fi
    echo "Enter condition column "
    read colName
    fieldNumber=`awk -v RS=';' "/$colName/ "'{print NR}' $table_name`
    if [ -z $fieldNumber ]
    then
    echo "col not exist"
    ./Table_menu.sh
    fi
    echo "enter conditon value "
    read value
    #line number
    searchResult=`cut -d ";" -f $fieldNumber $table_name 2>/dev/null|awk "/$value/"'{print NR}' `
    echo $searchResult  
    if [ -z $searchResult ]
    then
    echo "value not exist"
    ./Table_menu.sh
    fi
    echo "Enter update col : "
    read colUpdate
    updateNum=`awk -v RS=';' "/$colUpdate/ "'{print NR}' $table_name`
    if [ -z $updateNum ]
    then
    echo "col not exist"
    ./Table_menu.sh
    fi
    echo $updateNum
    colType=`cut -d";" -f $updateNum $table_name|cut -d":" -f 2|head -1`;
    echo "enter new value"
    read newValue
    testInput $newValue $colType
    if [ $? -eq 0 ]
    then
        echo "Wrong Type"
        ./Table_menu.sh
    fi
    checkPk $table_name $newValue
    if [ $? -eq 0 ]
    then
        echo "pk exist"
        tableMenue
    fi
    oldValue=$(awk 'BEGIN{FS=";"} {
    if(NR=="'$searchResult'"){
         print $'$updateNum';     
         }
      }' $tableName)
    sed -i ''$searchResult's/'$oldValue'/'$newValue'/g' $table_name 2>>/dev/null
}