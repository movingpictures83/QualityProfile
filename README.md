# QualityProfile
# Language: R
# Input: DIRECTORY
# Output: PREFIX
# Tested with: PluMA 1.1, R 4.0.0
# dada2_1.18.0

Take a set of reads and output a set of quality measurements.

The plugin takes as input a directory that contains reads assumed to be in FASTQ format.

Quality scores for forward and reverse reads will be output in a collection of CSV files that start with the provided output prefix.
