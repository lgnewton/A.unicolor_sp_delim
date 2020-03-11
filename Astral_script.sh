###Astral script for besttrees.tre file from 33 minimum sample locus, 0.85 clustering threshold, all 157 individuals MAGNET run

# 1. Install ASTRAL by downloading zip file at https://github.com/smirarab/ASTRAL
# 2. Read through documentation and prepare input tree file (Newick format)
###  our input file was prepared using the MAGNET pipeline (https://justinbagley.org/MAGNET/) that infers Maximum Likelihood gene trees for many RAD loci

#change into the directory where astral executable was placed
cd ~/Astral

#run astral with input file besttrees.tre from Magnet, gene-only resampling, and output for view in figtree
java -jar astral.5.6.3.jar -i ~/besttrees.tre -o ~/Antro_33msl_astral_gene-only.tre --gene-only 2> Antro_33msl_astral_gene-only.log

#run astral with input file besttrees.tre from MAGNET and output for view in figtree 
java -jar astral.5.6.3.jar -i ~/besttrees.tre -o ~/Antro_33msl_astral.tre 2> Antro_33msl_astral.log
