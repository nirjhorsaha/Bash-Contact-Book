
#!bin/bash
echo    "                -------------------                "
echo -e "---------------| Bash Contact Book |---------------"
echo    "                -------------------                "

exit=0

PhoneBook="phonebook.txt"


while [ $exit -ne 1 ]
do
echo -e "\n>>>  What would you like to do?  <<<"
echo -e "\n\t  [1] Create New Contact\n\t  [2] Display existing contact\n\t  [3] Sort Contact\n\t  [4] Delete Contact\n\t  [5] Search Contact\n\t  [6] Update Contact\n\t  [7] Quit\n"

printf ">> Your choice number is: "
read choice
echo " "

if [ "$choice" -eq 1 ]
then
    printf "  Enter the First name  : "
    read f_name
    printf "  Enter the Last name   : "
    read l_name
    printf "  Enter the Phone number: "
    read number
        echo "$f_name $l_name : $number" >> $PhoneBook
        echo     " -----------------------------  "
        echo -e  "| Contact Successfully Saved👍 |"
        echo     " -----------------------------  "


elif [ "$choice" -eq 2 ]
then
    echo -e " > The available phone records are: \n"
    cat -n $PhoneBook


elif [ "$choice" -eq 3 ]
then
    printf "   [1] Sort by First Name\n   [2] Sort by Last Name\n   [3] Sort by Phone Number\n"
    printf "\nEnter the corresponding number to sort: "
    read pattern

    if [ "$pattern" -eq 1 ]
    then
        echo -e "\n> The sorted list of Phone book by First name:"
        echo " "
        sort -t" " -k 1 $PhoneBook
        echo -------------------------------------------

    elif [ "$pattern" -eq 2 ]
    then
        echo -e "\n> The sorted list of Phone book by Last name:"
        sort -t" " -k 2 $PhoneBook
        echo -------------------------------------------

    else
        echo -e "\n> The sorted list of Phone book by Phone Number"
        sort -t":" -k 2 $PhoneBook
        echo -------------------------------------------
    fi


elif [ "$choice" -eq 4 ]
then
    echo -e "The available phone records are:\n"
    cat -n $PhoneBook
    printf "\n Enter the name of the contact you want to delete: "
    read phone_no
    printf " Are you sure to delete this contact.? Y/N: "
    read confirmation
    if [ "$confirmation" == Y ]
    then
        sed -i "/$phone_no/d" $PhoneBook
        echo -e "\t ------------------------  "
        echo -e "\t| Delete Successfully.!✔ | "
        echo -e "\t ------------------------  "
    else
        echo Return main menu.
    fi


elif [ "$choice" -eq 5 ]
then
    printf "  Enter the name or phone number: "
    read name
    if grep -rq "$name" $PhoneBook     # -r -recursive search and q -quit to display output
    then
        echo -e "\n  > The contact is:" $(grep $name $PhoneBook)
    else
        echo -e "\n\tContact not found.!"
    fi


elif [ "$choice" -eq 6 ]
then
    printf " Enter the name or number: "
    read f_no
    printf " Enter modified name or number: "
    read f_name
        NEW=`echo $f_name`
        OLD=`echo $f_no`
        sed -i s/"$OLD"/"$NEW"/g phonebook.txt
            echo -e "\t -----------------  "
            echo -e "\t| Record Modified.| "
            echo -e "\t -----------------  "


elif [ "$choice" -eq 7 ]
then
    echo -e " ~~~  Thanks for using the Bash Contact Book ~~~ \n"
    exit=1
    break
else
    printf " No such options. Please select again\n"
fi
done
exit=1