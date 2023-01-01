#!/bin/bash

read primary < $(sed '2!d' $table_name)
read -a cols < $(sed '4!d' $table_name )
read -a datatype < $(sed '6!d' $table_name )
echo -e "Columns of the table : \n ${cols[@]} \n"
echo -e "The data type for each column ( int  -> integer ),( string -> string datatype )\n"
echo ${datatype[@]};
echo -e "The Column index which have the primary key constraint : \n $primary \n"
echo -e "\n"

