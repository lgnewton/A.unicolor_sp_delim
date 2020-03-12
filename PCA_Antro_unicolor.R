# Principal Components Analysis

# Install adegenet if you haven't already
install.packages('adegenet')

# Optional - install jcolors for access to color palettes
library(devtools)
devtools::install_github("jaredhuling/jcolors")

# Load packages needed for this script
library(adegenet)
library("jcolors")
library(ggplot2)
library(cluster)

# Read in data as structure file containing unlinked SNPs (.stru) - convert to genind object
# Adjust file name, n.ind, n.loci; n.ind = number of individuals; n.loci = number of unlinked SNPs
data <- read.structure("~/Desktop/Ch1_Antro_files/3RAD Data/Concatenated Data/clust_0.85/LTE_no_outgroups/33msl/25maxSNPs_10maxIndels/33msl_Antro_P1-3_edit_no_outgroups.stru", n.ind=157, n.loc=1716, onerowperind=FALSE, col.lab=1, col.pop=0, col.others=NULL, row.marknames=NULL, NA.char="-9", pop=NULL, ask=FALSE, quiet=FALSE)

# Put data values into a matrix
data_scaled <- scaleGen(data, center=FALSE, scale=FALSE, NA.method=c("zero"))

# Create duality diagram of most important components
pca1 <- dudi.pca(data_scaled, center=TRUE, scale=TRUE)

# You will need to select the number of components (axes) you want to use (just type the number of components you want, then hit ENTER)
# Will then see a bar graph, where each column represents a single component. The taller the column, the more informative that component is. 

# To plot components 1 and 2
plot(pca1$li[c(1,2)])

# To plot components 1 and 2 with labels
s.label(pca1$li[c(1,2)], clabel=0.5, grid=0)

# To export components 1 and 2 to a csv file
setwd("~/")
write.csv(pca1$li[c(1,2)], "Antro33msl_pca_PC1&2.csv")

#Ccan use csv as input for other functions, like procrustes
# Add a column identifying to which group each individual belongs - could probably do this in R, easier for me to add column in excel
# Groups should be assigned by number; start with 1, not 0

# Bring edited csv file back into R
##this pca.csv file has 5 clades delimited - micro, UnicolorA, UnicolorB1,2,&3
group_data <- read.csv('pca_5clades.csv')

# Assign values in group column to variable 'group'; 'Lineages' comes from the group column header in the csv file
group=c(group_data$Lineages)

# Basic plot
ggplot(group_data, mapping=aes(x=group_data$Axis1, y=group_data$Axis2)) + geom_point()

# Add colors and shapes corresponding to each lineage
Lineages <- as.factor(group_data3$Lineages)
a <- ggplot(group_data3, aes(x=group_data3$Axis1, y=group_data3$Axis2))+ geom_point(aes(color=Lineages, shape=Lineages), size = 3) + labs(title="Genetic Clusters", x="PCA1", y="PCA2") + xlim(c(-50,30)) + ylim(c(-30,30))
a + scale_color_jcolors(palette="default")

# Make this PCA plot a png image
png(filename="PCA_5Lineages.png", height=800, width=1100)
Lineages <- as.factor(group_data3$Lineages)
a <- ggplot(group_data3, aes(x=group_data3$Axis1, y=group_data3$Axis2))+ geom_point(aes(color=Lineages, shape=Lineages), size = 3) + labs(title="Genetic Clusters", x="PCA1", y="PCA2") + xlim(c(-50,30)) + ylim(c(-30,30))
a + scale_color_jcolors(palette="default")
dev.off()

# Make this PCA plot a tiff image
tiff(filename="PCA_5Lineages.tiff", height=800, width=1100)
a <- ggplot(group_data3, aes(x=group_data3$Axis1, y=group_data3$Axis2))+ geom_point(aes(color=Lineages, shape=Lineages), size = 3) + labs(title="Genetic Clusters", x="PCA1", y="PCA2") + xlim(c(-50,30)) + ylim(c(-30,30))
a + scale_color_jcolors(palette="default")
dev.off()
