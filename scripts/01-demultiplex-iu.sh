#!/bin/bash -i 

conda activate iu-env 

mkdir -p 220919_demultiplexed

iu-demultiplex --r1 Undetermined_S0_L001_R1_001.fastq.gz --r2 Undetermined_S0_L001_R2_001.fastq.gz -i Undetermined_S0_L001_I1_001.fastq.gz -o 220919_demultiplexed -s i7index_pool1.noheader.tsv 
