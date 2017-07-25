#!/usr/bin/env bash

#163_TRACE-Sprint-11-ALTERNATE.sh
#all changes needed for this version to remove extra modules

####################################################################
# Per Trac-618 : Pruning modules 
# cdeane July 25, 2017
# remove of islandora_solution_pack_audio
# remove of islandora_solution_pack_video

####################################################################
# the code below installs all islandora modules whether you want them or not
# resistance is impossible...

#==> default: Installing all Islandora Foundation modules
#==> default: Setting permissions and ownership for Drupal directories
#==> default: Cloning Islandora modules
#==> default: Cloning into 'islandora'...
# ...
#==> default: Cloning into 'islandora_solution_pack_audio'...
# ...
# ==> default: Cloning into 'islandora_solution_pack_video'...
# ...
# resistance is impossible...
#
# so I will remove the undesireables now

echo "163_: REMOVE islandora_solution_pack_audio"
sudo rm -rf "$DRUPAL_HOME"/sites/all/modules/islandora_solution_pack_audio
echo "163_: REMOVE islandora_solution_pack_video"
sudo rm -rf "$DRUPAL_HOME"/sites/all/modules/islandora_solution_pack_video


echo "163_: Audio and video modules have been removed."

