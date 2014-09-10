#!/bin/sh 
##############################################################################
# Copyright by The HDF Group.                                                #
# All rights reserved.                                                       #
#                                                                            #
# This file is part of H5Serv (HDF5 REST Server) Service, Libraries and      #
# Utilities.  The full HDF5 REST Server copyright notice, including          #
# terms governing use, modification, and redistribution, is contained in     #
# the file COPYING, which can be found at the root of the source code        #
# distribution tree.  If you do not have access to this file, you may        #
# request a copy from help@hdfgroup.org.                                     #
##############################################################################
#todo - verify that current directory is the same as the script
if [ $# -ne 1 ] || [ $1 != '-f' ]
then
    echo "this will remove all files from ../../data and repopulate using files from ../../testdata!  run with -f to proceed"
    exit 1
fi
export SRC="../../testfiles/"
export DES="../../data"
rm -rf $DES/*
mkdir $DES/subdir
mkdir $DES/subdir/subsubdir
cp $SRC/tall.h5 $DES
cp $SRC/tall.h5 $DES/tall_g2_deleted.h5
cp $SRC/tall.h5 $DES/tall_dset112_deleted.h5
cp $SRC/notahdf5file.h5 $DES
cp $SRC/zerodim.h5 $DES/"filename with space.h5"
cp $SRC/zerodim.h5 $DES/subdir
cp $SRC/zerodim.h5 $DES/subdir/subsubdir
cp $SRC/zerodim.h5 $DES/deleteme.h5
cp $SRC/zerodim.h5 $DES/subdir/deleteme.h5
cp $SRC/zerodim.h5 $DES/readonly.h5
chmod -w $DES/readonly.h5
python makegroups.py  # creates 'group1k.h5'
mv group1k.h5 $DES





