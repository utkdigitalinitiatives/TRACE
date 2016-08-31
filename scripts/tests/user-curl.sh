#!/bin/bash
#
# start user tests
echo -e "Testing default users of roles\n"
# url of an obj: http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
#
echo -e "\n***** Testing anonymous: "
curl -s -o libraries_3.pdf  http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo "anonymous can download content"
  rm -f ./libraries_3.pdf
else
  echo "anonymous cannot download content"
fi
echo -e "\n***** Testing authUser: "
curl -s -o libraries_3.pdf -u authUser:authUser http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo "authuser can download content"
  rm -f ./libraries_3.pdf
else
  echo "authUser cannot download content"
fi
echo -e "\n***** Testing manager: "
curl -s -o libraries_3.pdf -u manager:manager http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo "manager can download content"
  rm -f ./libraries_3.pdf
else
  echo "manager cannot download content"
fi
