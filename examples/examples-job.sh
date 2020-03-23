#!/bin/sh
# $Id: examples-job.sh,v 1.2 2014/11/13 13:25:58 philip Exp $

# script to produce the output in the example directory

tmpdir=t
mkdir $tmpdir 2>/dev/null
cd $tmpdir
echo "will do work in `pwd` to avoid overwriting the distribution's examples"

quilt_home=`pwd`/../..
quilt_scripts=$quilt_home/scripts
PATH=$quilt_scripts:$PATH
export PDBPATH=..:.

one-structure.sh 8lyz






