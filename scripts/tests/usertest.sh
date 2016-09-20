#!/usr/bin/env bash
#
# start user tests
echo -e "Testing default users of roles\n"
# url of an obj: http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
#
echo -e "\n***** Testing anonymous: \n"
curl -s -o libraries_3.pdf  http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo -e "Pass: anonymous can download content\n"
  rm -f ./libraries_3.pdf
else
  echo -e "Fail: anonymous cannot download content\n"
fi
echo -e "\n***** Testing authUser: \n"
curl -s -o libraries_3.pdf -u authUser:authUser http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo -e "Pass: authuser can download content\n"
  rm -f ./libraries_3.pdf
else
  echo -e "Fail: authUser cannot download content\n"
fi
echo -e "\n***** Testing manager: \n"
curl -s -o libraries_3.pdf -u manager:manager http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo -e "Pass: manager can download content\n"
  rm -f ./libraries_3.pdf
else
  echo -e "Fail: manager cannot download content\n"
fi
echo -e "\n***** Testing privuser: \n"
curl -s -o libraries_3.pdf -u privuser:privuser http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo -e "Pass: privuser can download content\n"
  rm -f ./libraries_3.pdf
else
  echo -e "Fail: privuser cannot download content\n"
fi
