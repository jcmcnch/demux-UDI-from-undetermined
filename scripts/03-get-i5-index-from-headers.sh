#!/bin/bash -i
conda activate bbmap-env

outdir=220919_demultiplexed

for item in 220919_demultiplexed/*R2.fastq ; do

        #get sample name
        filestem=`basename $item -R2.fastq`

        #pull out illumina headers
        filterbyname.sh in=$item names=i5-headers/$filestem.headers.txt include=t out=${outdir}-I2.fastq

done
