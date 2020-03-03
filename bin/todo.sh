#!/bin/bash
#  ██████╗  ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗  ██╗
#  ██╔══██╗██╔═══██╗╚██╗██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝
#  ██████╔╝██║   ██║ ╚███╔╝ ██║  ██║██║   ██║ ╚███╔╝ 
#  ██╔══██╗██║   ██║ ██╔██╗ ██║  ██║██║   ██║ ██╔██╗ 
#  ██████╔╝╚██████╔╝██╔╝ ██╗██████╔╝╚██████╔╝██╔╝ ██╗
#  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝
# No innovation here, just stole someone's idea.                                               

file='.todos'
divider=\~

# Create, if file doesn't exist
if [[ ! -e .todos ]]; then
	touch $file
fi

# Parse the arguments and run commands.
if [[ -z $1 || $1 == "--help" || $1 == "-h" || $1 == "help" ]]; then
	echo -e "A simple shell script to display To-Do list" >&2
	echo
	echo -e "\t-s, --show, show \t\t\tDisplays the TO-DO List"
	echo -e "\t-a, --add, add \"To-Do Item\" \t\tAdd a todo item to the list"
	echo -e "\t-r, --remove, remove Index \t\tRemove a todo item from the list"
	echo -e "\t-h, --help \t\t\t\tPrints this text"
	echo
	exit 1

elif [[ -z $1 || $1 == "--add" || $1 == "-a" || $1 == "add" ]]; then
	if [[ -z $2 ]]; then
		echo "missing argument, run todo --help"
	else
		echo "$2" >> $file
	fi

elif [[ -z $1 || $1 == "--remove" || $1 == "-r" || $1 == "remove" ]]; then
	if [[ -z $2 ]]; then
		echo "missing argument, run todo --help"
	else
		sed -e $2'd' -i  $file
	fi

elif [[ -z $1 || $1 == "--show" || $1 == "-s" || $1 == "show" ]]; then
	clear

	# draw the logo!
	echo "                                         "
	echo "████████╗ ██████╗       ██████╗  ██████╗ "
	echo "╚══██╔══╝██╔═══██╗      ██╔══██╗██╔═══██╗"
	echo "   ██║   ██║   ██║█████╗██║  ██║██║   ██║"
	echo "   ██║   ██║   ██║╚════╝██║  ██║██║   ██║"
	echo "   ██║   ╚██████╔╝      ██████╔╝╚██████╔╝"
	echo "   ╚═╝    ╚═════╝       ╚═════╝  ╚═════╝ "
	echo "                                         "

	# Print to-dos
	i=1
	while IFS= read -r line
	do
		echo -e "\t$i. $line"
		i=$((i + 1))
	done < $file
	echo

	# Print a dividing line
	printf -vl "%${COLUMNS:-`tput cols 2>&-||echo 80`}s\n" && echo ${l// /$divider};
else
	echo "unknown option"
	echo "run todo --help for available commands"
fi
exit
