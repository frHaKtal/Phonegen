#/bin/bash

while getopts ":p:" input;do
        case "$input" in
                p) phone=${OPTARG}
                        ;;
                esac
        done
if [ -z "$phone" ]
        then
                echo "Please give a phone number to generated \"-p 06XXXXXX32 or 06******32\"" | lolcat
                exit 1
fi
#phone=06XXXXXX32
#phone=06******32
echo "

 ______  _                                         
(_____ \| |                                        
 _____) ) |__   ___  ____  _____  ____ _____ ____  
|  ____/|  _ \ / _ \|  _ \| ___ |/ _  | ___ |  _ \ 
| |     | | | | |_| | | | | ____( (_| | ____| | | |
|_|     |_| |_|\___/|_| |_|_____)\___ |_____)_| |_|
                                (_____|            
"| lolcat
echo "                                      by _frHaKtal_" | lolcat
echo " "

phone=${phone//[*]/X}
list_of_x=${phone//[^X]}
pos_first_x=`expr index "$phone" X`
number_to_x=${#list_of_x}
prefixe=${phone:0:pos_first_x-1}
prefixe_len=${#prefixe}
rest_number=${phone:number_to_x+prefixe_len}

echo "..Generating phone numbers, please wait..." | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols) | lolcat


if [ $number_to_x -eq 6 ]
then
	for i in {000000..999999}
	do
		echo "$prefixe$i$rest_number" >> phone_numbers.txt
	done
fi

if [ $number_to_x -eq 7 ]
then
        for i in {0000000..9999999}
        do
                echo "$prefixe$i$rest_number" >> phone_numbers.txt
        done
fi

if [ $number_to_x -eq 8 ]
then
        for i in {00000000..99999999}
        do
                echo "$prefixe$i$rest_number" >> phone_numbers.txt
        done
fi

echo "...Phone_numbers.txt as been generated..." | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols) | lolcat
