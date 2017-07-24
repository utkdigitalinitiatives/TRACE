#!/usr/bin/env bash

# Test if anonymous user has permission to download content
echo -e "Testing default users of roles\n"
# url of an obj: http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
echo -e "\n***** Testing anonymous: \n"
curl -s -o 170.pdf  http://localhost:8000/islandora/object/gradthes%3A1/datastream/OBJ/view#overlay-context=islandora/object/gradthes%253A1
if [ -f ./170.pdf ]; then
  echo -e "Pass: anonymous can download content\n"
  rm -f ./170.pdf
else
  echo -e "Fail: anonymous cannot download content\n"
fi

# Test if authuser has permission to download content
echo -e "\n***** Testing authUser: \n"
curl -s -o 170.pdf -u authUser:authUser http://localhost:8000/islandora/object/gradthes%3A1/datastream/OBJ/view#overlay-context=islandora/object/gradthes%253A1
if [ -f ./170.pdf ]; then
  echo -e "Pass: authuser can download content\n"
  rm -f ./170.pdf
else
  echo -e "Fail: authUser cannot download content\n"
fi

# Test if manager has permission to download content
echo -e "\n***** Testing manager: \n"
curl -s -o 170.pdf -u manager:manager http://localhost:8000/islandora/object/gradthes%3A1/datastream/OBJ/view#overlay-context=islandora/object/gradthes%253A1
if [ -f ./170.pdf ]; then
  echo -e "Pass: manager can download content\n"
  rm -f ./170.pdf
else
  echo -e "Fail: manager cannot download content\n"
fi

# Test if privuser has permission to download content
echo -e "\n***** Testing privuser: \n"
curl -s -o 170.pdf -u privuser:privuser http://localhost:8000/islandora/object/gradthes%3A1/datastream/OBJ/view#overlay-context=islandora/object/gradthes%253A1
if [ -f ./170.pdf ]; then
  echo -e "Pass: privuser can download content\n"
  rm -f ./170.pdf
else
  echo -e "Fail: privuser cannot download content\n"
fi
