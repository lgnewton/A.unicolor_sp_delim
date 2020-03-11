##### Script for running STRUCTURE Analyses #####

# Download STRUCTURE from https://web.stanford.edu/group/pritchardlab/structure.html and read manual for program details
# edit mainparams file to fit your analysis; can also edit extraparams file
# can also use added command-line flags for simplify batch runs, which I used

####### Variables #######
input_file="name_of_unlinkedSNP_file"
output_file="informative_name"
rep_number="rep#"
K_number="K#"
#########################

### General STRUCTURE run ###
./structure -K $K_number -i $input_file -o ${output_file}_${rep_number}_${K_number} # with the mainparams file filled out to your specifications

### My specific STRUCTURE runs ###
## All A. unicolor individuals ##
# -i (input file) = unlinked SNPs with 20% taxon coverage 
# -o = output file that included an informative name, replicate number, and K number 
# -K = number of populations; tested K= 1-10 with 5 replicates each
# -N = 157 A. unicolor individuals
# -L = 1717 loci 
input_file="A_unicolor_33msl.stru"
output_file="A_unicolor_33msl"
./structure -K $K_number -i $input_file -N 157 -L 1717 -o ${output_file}_${rep_number}_${K_number}
 
## A. unicolorB individuals ##
# -i (input file) = unlinked SNPs with 30% taxon coverage; -o = output file 
#-K = number of populations; tested K = 1-10 with 5 replicates each
# -N = 120 A. unicolorB individuals
# -L = 2404 loci  
input_file="UnicolorB_30percent.stru"
output_file="UnicolorB_36msl"
./structure -K $K_number -i $input_file -N 120 -L 2404 -o ${output_file}_${rep_number}_${K_number}

# -i (input file) = unlinked SNPs with 40% taxon coverage; -o = output file 
#-K = number of populations; tested K = 1-10 with 5 replicates each
# -N = 120 A. unicolorB individuals
# -L = 1274 loci  
input_file="UnicolorB_40percent.stru"
output_file="UnicolorB_48msl"
./structure -K $K_number -i $input_file -N 120 -L 1274 -o ${output_file}_${rep_number}_${K_number}

# -i (input file) = unlinked SNPs with 50% taxon coverage; -o = output file 
#-K = number of populations; tested K = 1-10 with 5 replicates each
# -N = 120 A. unicolorB individuals
# -L = 779 loci  
input_file="UnicolorB_50percent.stru"
output_file="UnicolorB_60msl"
./structure -K $K_number -i $input_file -N 120 -L 779 -o ${output_file}_${rep_number}_${K_number}

# -i (input file) = unlinked SNPs with 60% taxon coverage; -o = output file 
#-K = number of populations; tested K = 1-10 with 5 replicates each
# -N = 120 A. unicolorB individuals
# -L = 510 loci  
input_file="UnicolorB_60percent.stru"
output_file="UnicolorB_72msl"
./structure -K $K_number -i $input_file -N 120 -L 510 -o ${output_file}_${rep_number}_${K_number}

# -i (input file) = unlinked SNPs with 70% taxon coverage; -o = output file 
#-K = number of populations; tested K = 1-10 with 5 replicates each
# -N = 120 A. unicolorB individuals
# -L = 324 loci  
input_file="UnicolorB_70percent.stru"
output_file="UnicolorB_84msl"
./structure -K $K_number -i $input_file -N 120 -L 324 -o ${output_file}_${rep_number}_${K_number}
