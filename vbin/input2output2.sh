#!/bin/bash
# This code was originally written by Paul Cummins to transform dc to mods for an entire directory.
#
# This version allows you to name
# -- your input_directory
# -- your output_directory
# -- your xsl transformation
#
# makes a directory and transforms DC files in
# directory in parameter and saves them in
# new directory
#
# if input_directory == output_directory, bad things will happen
#
#                                    $1              $2              $3
# commandline:  perl input2output.sh inputDirName    outputDirName   myxsl.xsl
##
# permissions in the input_directory should be 755
#
#

for X in $1/*.xml;
 do nX=`basename $X`;
  xsltproc -o $2/$nX  $3       $X;
 done

