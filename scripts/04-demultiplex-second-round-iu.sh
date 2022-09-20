#!/bin/bash -i
conda activate iu-env

outdir=220920_demultiplexed
mkdir -p $outdir

for item in 220919_demultiplexed/*R2.fastq ; do

        #get sample name
        filestem=`basename $item -R2.fastq`
	R1=`ls 220919_demultiplexed/$filestem*R1*`
	R2=`ls 220919_demultiplexed/$filestem*R2*`
	I2=`ls 220919_demultiplexed/$filestem*I2*`
	bc2sample=`ls i5-bc2sample/$filestem*`

	echo iu-demultiplex --r1 $R1 --r2 $R2 -i $I2 -o $outdir -s $bc2sample

done
