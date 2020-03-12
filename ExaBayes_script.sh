### ExaBayes script to get Bayesian phylogenetic inference

## I ran this script on Auburn University's Hopper HPC

#!/bin/bash

### Load modules for Hopper HPC ###
module load gcc/5.3.0
module load exabayes

###VARIABLES
input_file="alignment_file" #A_unicolor_33msl.phy
ID="informative_name" #Antro_33msl


### ExaBayes script
# -d = carries out dry run - only tests config and alignment file
# -f = input file
# -m = specific data type (either DNA or PROT)
# -n = ID
# -r = restarts your run from a previous id (nice if your job gets killed on the HPC)
# -s = provides a random seed
# -c = configuration file with parameters edited to your specifications
# -R = specifies the number of runs to be executed in parallel
# -C = specifies number of chains to be executed in parallel
# -T = specifies number of threads

yggdrasil -f $input_file -m DNA -n $ID -s 10 -c config.nex -R 2 -C 4 -T 8

# post-processing tool = create a consensus tree and then examine in a tree viewer (e.g., FigTree)
consense -f ExaBayes_topologies.${ID}.0 -n $ID