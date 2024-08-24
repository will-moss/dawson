#!/bin/bash

# Detect Python and Pip
which python3
if [ $? -ne 0 ]; then
  echo "It seems that Python 3.X is not installed on your system."
  echo "Please first ensure that the python3 executable is available"
  exit
fi

which pip3
if [ $? -ne 0 ]; then
  echo "It seems that pip 3.X is not installed on your system."
  echo "Please first ensure that the pip3 executable is available"
  exit
fi

# Install dependencies
curl -L -s https://raw.githubusercontent.com/will-moss/dawson/master/requirements.txt > requirements.txt
pip3 install -r requirements.txt
rm requirements.txt

# Prepare the download URL
GITHUB_LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/will-moss/dawson/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
GITHUB_FILE="dawson"
GITHUB_URL="https://github.com/will-moss/dawson/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

# Install/Update the local binary
curl -L -o dawson $GITHUB_URL

DESTINATION="/usr/bin"
if [ -d "/usr/local/bin" ]; then
  DESTINATION="/usr/local/bin"
fi

mv dawson $DESTINATION
chmod 755 $DESTINATION/dawson
