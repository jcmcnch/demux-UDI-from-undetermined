#!/bin/bash -i

#make output dirs
mkdir -p i5-headers i5-bc2sample

for item in 220919_demultiplexed/*R2.fastq ; do 
	
	#get sample name
	filestem=`basename $item -R2.fastq`

	#pull out illumina headers, stripping "@" character so filterbyname.sh will work
	#grep "^@" $item | sed 's/@//' > i5-headers/$filestem.headers.txt

	#make new individual sample-to-barcode.tsv files for second round of illumina-utils
	grep $filestem i5index_v1.5_pool1.tsv > i5-bc2sample/$filestem.bc2sample.tsv

done
