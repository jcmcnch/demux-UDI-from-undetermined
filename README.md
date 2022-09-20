# demux-UDI-from-undetermined

This workflow is designed to demultiplex dual-indexed Illumina reads in the case where you lack the original basecall folder and therefore can't use `bcl2fastq` for the demultiplexing. There may be an easier way to do this, but I couldn't figure one out!

Steps:

1. Using the i7 index, demultiplex with `illumina-utils`, which will generate R1/R2 reads for each sample (or collection of samples). However, `illumina-utils` does not have an option to export the i5 indices, so we need to use a number of manual steps to recover that info for a second round of demultiplexing.
2. The first step is to grab headers from R2 reads using `grep` and use `sed` to remove the `@` character.
3. Since those headers are identical in the index read file (at least in this use case), we can directly use those headers to grab the I2 reads for each sample using `filterbyname.sh` which is part of the `bbtools` suite.
4. Now run `illumina-utils` sample by sample to cull out any reads that do not have a perfect match to the i5 index. In this case, we're using UDIs so it is essentially a QC step. However, if you are not using UDIs it might very well be necessary to recover your samples if there are non-unique indexes in your sequencing pool.
