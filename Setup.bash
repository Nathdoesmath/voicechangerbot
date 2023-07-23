#!/bin/bash

while getopts t:i:g:c:l:h: option
do
	case "${option}"
		in
		t)
			token = ${option};;
		i)
			clientId = ${option};;
		g)
			guildID = ${option};;
		c)
			condName = ${option};;
		l)
			condLoc = ${option};;
		h)
			echo 
"|----------------------------------------------------
| Help
|
|	-h		Ouputs the help message
|
|	-t		Specifies the Discord bot token
|
|	-i 		Specefies the Discord bot application ID
|
|	-g		Specefies the ID of the test server
|
|	-c 		Specifies the Conda environment name
|
|	-l		Specifies the Conda environment file path
|----------------------------------------------------"
			exit;;
	esac
done
		

# ----------------------------------
# Determine if the necessary packages are present
if command -v node &> /dev/null; then

    # node is installed, capture the version in a variable
    node_version=$(node -v)
    echo "node version: $node_version"

else
    # node is not installed
    echo "Node is not installed. Please install Node.js to proceed. See the official installation instructions for your specific operating system"
	exit
fi


# Check if npm is installed
if command -v npm &> /dev/null; then

    # npm is installed, capture the version in a variable
    npm_version=$(npm -v)
    echo "npm version: $npm_version"

else
    # npm is not installed
    echo "npm is not installed. Please install npm to proceed. Try using sudo apt-get install npm"
	exit
fi
# ---------------------------------

