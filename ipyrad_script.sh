##### ipyrad script #####

# Install ipyrad from https://ipyrad.readthedocs.io/en/latest/ and read the documentation

####### Variables #######
assembly_name="informative_name"

#########################

### General ipyrad run ###
# create a new assembly 
ipyrad -n $assembly_name

## Edit the params file to your specifications - will have the file name params-${assembly_name}.txt
## I started out with default parameters and later tweaked the params file as needed (e.g., clustering threshold, min_samples_locus, max_SNPs_locus, output formats)

# Run step 1 - demultiplexing/loading fastq files
# -p = params file to use for command; -s = step number (can be multiple); -d = debug = provides more info if an error is occurring
# if running on HPC: -c = total number of cores you are using (optional); --MPI = something to do with using multiple processors (optional)
ipyad -p params-${assembly_name}.txt -s 1 -d -c 40 --MPI 

# Run step 2 - filtering/editing reads
ipyad -p params-${assembly_name}.txt -s 2 -d -c 40 --MPI

## Edit params file datatype from pair3rad to pairddrad after first 2 steps (at least for the version I used) - still not sure why it wouldn't work unless you did this?
sed -i '/\[7] /c\pairddrad  ## [7] [datatype]' params-${assembly_name}.txt

# Run step 3 - clustering/mapping reads within samples and alignment
ipyad -p params-${assembly_name}.txt -s 3 -d -c 40 --MPI

# Run step 4 - joint estimation of heterozygosity and error rate
ipyad -p params-${assembly_name}.txt -s 4 -d -c 40 --MPI

# Run step 5 - consensus base calling and filtering
ipyad -p params-${assembly_name}.txt -s 5 -d -c 40 --MPI

# Run step 6 - clustering/mapping reads among samples and alignment
ipyad -p params-${assembly_name}.txt -s 6 -d -c 40 --MPI

# Run step 7 - filtering and formatting output files
ipyad -p params-${assembly_name}.txt -s 7 -d -c 40 --MPI