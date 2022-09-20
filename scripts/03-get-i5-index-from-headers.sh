#!/bin/bash -i
conda activate bbmap-env

outdir=220919_demultiplexed

for item in 220919_demultiplexed/*R2.fastq ; do

        #get sample name
        filestem=`basename $item -R2.fastq`
	I2=Undetermined_S0_L001_I2_001.fastq.gz

        #pull out illumina headers
        filterbyname.sh in=$I2 names=i5-headers/$filestem.headers.txt include=t out=$outdir/${filestem}-I2.fastq

done
