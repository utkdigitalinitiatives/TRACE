#!/usr/bin/env bash

echo "drush revise CModel Labels"
#if fedora password is not defined by the system, define it here
if [ "$FEDORAPASS" = "" ]; then
  FEDORAPASS="fedoraAdmin"
fi

# Original Label                                Content Model Type
#Islandora Binary Object Content Model          islandora:binaryObjectCModel
#Islandora Internet Archive Book Content Model  islandora:bookCModel
#Islandora Collection Content Model             islandora:collectionCModel
#Islandora Page Content Model                   islandora:pageCModel
#Islandora Audio Content Model                  islandora:sp-audioCModel
#Islandora Basic Image Content Model            islandora:sp_basic_image
#Islandora Large Image Content Model            islandora:sp_large_image_cmodel
#Islandora Binary Object Content Model          islandora:sp_pdf
#Islandora Video Content Model                  islandora:sp_videoCModel

# info:fedora/ir:citationCModel
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/ir:citationCModel?label=chd_citation"

# info:fedora/ir:thesisCModel
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/ir:thesisCModel?label=Thesis or Dissertation"

# info:fedora/islandora:binaryObjectCmodel
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/islandora:binaryObjectCModel?label=Other"

# info:fedora/islandora:bookCModel
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/islandora:bookCModel?label=chd_book"

# info:fedora/islandora:collectionCModel
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/islandora:collectionCModel?label=Collection"

# info:fedora/islandora:pageCModel
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/islandora:pageCModel?label=chd_page"

# info:fedora/islandora:sp-audioCModel
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/islandora:sp-audioCModel?label=chd_audio"

# info:fedora/islandora:sp_basic_image
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/islandora:sp_basic_image?label=chd_basic_image"

# info:fedora/islandora:sp_large_image_cmodel
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/islandora:sp_large_image_cmodel?label=chd_large_image"

# info:fedora/islandora:sp_pdf
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/islandora:sp_pdf?label=PDF"

#info:fedora/islandora:sp_videoCModel
curl -vv -u "fedoraAdmin:$FEDORAPASS" -X PUT "http://localhost:8080/fedora/objects/islandora:sp_videoCModel?label=chd_video"

echo "CModel Labels have been revised."
