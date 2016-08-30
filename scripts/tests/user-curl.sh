#!/bin/bash
#
# start user tests
echo "Testing default users of roles"
# url of an obj: http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
#
echo "\n***** Testing anonymous: \n"
curl -o libraries_3.pdf  http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo "anonymous can download content"
  rm -f ./libraries_3.pdf
else
  echo "anonymous cannot download content"
fi
echo "\n***** Testing authUser: \n"
curl -o libraries_3.pdf -u authUser:authUser http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo "authuser can download content"
  rm -f ./libraries_3.pdf
else
  echo "authUser cannot download content"
fi
echo "\n***** Testing manager: \n"
curl -o libraries_3.pdf -u manager:manager http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo "manager can download content"
  rm -f ./libraries_3.pdf
else
  echo "manager cannot download content"
fi
