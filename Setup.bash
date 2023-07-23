#!/bin/bash

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

