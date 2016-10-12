#!/bin/bash

echo "drush revise CModel Labels"

#Original Label                         Content Model Type
#Islandora Basic Image Content Model    islandora:sp_basic_image
#Islandora PDF Content Model            islandora:sp_pdf
#Islandora Large Image Content Model    islandora:sp_large_image_cmodel
#Thesis Content Model                   ir:thesisCModel
#Islandora Binary Object Content Model  ir:binaryObjectCmodel

cd /usr/local/fedora

# islandora:sp_basic_image
curl -vv -u "fedoraAdmin:fedoraAdmin" -X PUT "http://localhost:8080/fedora/objects/islandora:sp_basic_image?label=chd_basic_image"

# islandora:sp_pdf
curl -vv -u "fedoraAdmin:fedoraAdmin" -X PUT "http://localhost:8080/fedora/objects/islandora:sp_pdf?label=chd_pdf"

# islandora:sp_large_image_cmodel
curl -vv -u "fedoraAdmin:fedoraAdmin" -X PUT "http://localhost:8080/fedora/objects/islandora:sp_large_image_cmodellabel=chd_large_image"


#ir:thesisCModel
curl -vv -u "fedoraAdmin:fedoraAdmin" -X PUT "http://localhost:8080/fedora/objects/ir:thesisCModel?label=chd_thesis"


# islandora:binaryObjectCmodel
curl -vv -u "fedoraAdmin:fedoraAdmin" -X PUT "http://localhost:8080/fedora/objects/islandora:binaryObjectCModel?label=chd_misc"

echo "CModel Labels have been revised."

