#!/bin/bash -i
for item in 220919_demultiplexed/*R2.fastq ; do filestem=`basename $item -R2.fastq` ; grep "^@" $item ; done
