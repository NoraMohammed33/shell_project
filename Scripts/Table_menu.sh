
    select table in "Create Table" "List Tables" "Drop Table" "Insert To Table" "Select From Table" "Delete From Table" "Back To Main Menu"
    do 
        case $table in 
        "Create Table" )
         ./Create_Table.sh;;
         "List Tables" )
         ./List_Tables.sh;;
         "Drop Table" )
         ./Drop_Table.sh;;
         "Insert To Table" )
         ./Insert_To_Table.sh;;
         "Select From Table" )
         ./Select_From_Table.sh;;
         "Delete From Table" )
         ./Delete_From_Table.sh;;
         "Back To Main Menu" )
         ./MainMenu.sh;;
         * )
            echo -e "Please Choose From The Upper Menu \n"
        esac
    done