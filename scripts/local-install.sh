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
pip3 install -r requirements.txt
rm requirements.txt

DESTINATION="/usr/bin"
if [ -d "/usr/local/bin" ]; then
  DESTINATION="/usr/local/bin"
fi

# Remove any previous installation
rm -f $DESTINATION/dawson

# Install the app's binary
mv dawson $DESTINATION/
chmod 755 $DESTINATION/dawson
