### RAxML script to get maximum likelihood phylogenetic inference

# Download RAxML at https://cme.h-its.org/exelixis/web/software/raxml/index.html and read documentation

#!/bin/bash

####### Variables #######
input="phylip_file" # A_unicolor_33msl.phy
output="informative_name" # A_unicolor_33msl.tre
#########################

#### RAxML 
## -s = input file name
## -N = specify number of alt. runs on distinct starting trees (autoMRE - use bootstrapping criteria?)
## -n = output file name
## -f a = rapid bootstrap analysis and search for best-scoring ML tree in one program run
## -p = specify a random number seed for the parsimony inferences
## -x = specify an integer # (random seed and turn on rapid bootstrapping)
## -m = model of substitution

~/standard-RAxML-master/raxmlHPC-SSE3 -s $input -N autoMRE -n $output -f a -p 12345 x 12345 -m GTRGAMMA 
