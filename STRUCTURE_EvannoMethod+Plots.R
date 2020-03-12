### Evaluating the optimal K value using Evanno method (per Evanno et al. 20005) on STRUCTURE runs

# Load libraries needed for analysis and plot
library(pophelper)
library(ggplot2)

# Set working directory
setwd("~/Desktop/Ch1_Antro_files/STRUCTURE/")

# Load all STRUCTURE files into R as a list
sfiles <- list.files(path="~/Desktop/Ch1_Antro_files/STRUCTURE/Antro33msl_K1-10_milliongens/", full.names=T)
slist <- readQ(files=sfiles,indlabfromfile=T)

# Optional - make sure object is a list
class(slist)

# Optional - make sure list has all of the STRUCTURE runs present; can also check individual and loci numbers
attributes(slist)
attributes(slist[[1]])

# Takes a qlist of one of more numeric dataframes and creates a table with filenames, K and number of individuals
tab <- tabulateQ(qlist=slist, writetable = T)

# Creates a summary table from a tabulated dataframe of two or more runs with k, number of runs and individuals
sum <- summariseQ(tab, writetable = T)

# Evanno method for detecting the appropriate number of population clusters from STRUCTURE results; Creates table and figure with Evanno method derivatives
# Optimal K value is the highest delta-K value
evannoMethodStructure(data=sum,exportplot=T,writetable=T,na.rm=T)

# Plot STRUCTURE run with Optimal K value 
# As far as I'm aware, pophelper only plots one replicate of the STRUCTURE run
# However, all replicates I ran had neglible population assignment differences for individuals, so I just used replicate 1 of K=8 from the list (slist[9]) to plot
plotQ(slist[9], showindlab=T, useindlab=T, sortind="all", returnplot=T, showsp=F, showlegend=T,indlabheight=0.3, basesize=10, legendkeysize=12,legendtextsize=20, showdiv=T, divcol="black", legendlab=c("A.unicolorB1","A.unicolorB2","A.unicolorB3","A.microunicolor","A.unicolorB4","A.unicolorA","A.unicolorB5","A.unicolorB6"),clustercol=c("#D12600","#DB6A00","#F5E400","#29BF12","#9CCADE","#00A5CF","#610052","#953272"))

# Make png image of plot with optimal K value
png(filename="STRUCTURE_AllIndividuals_K=8.png", height=550, width=1300)
plotQ(slist[9], showindlab=T, useindlab=T, sortind="all", returnplot=T, showsp=F, showlegend=T,indlabheight=0.3, basesize=10, legendkeysize=12,legendtextsize=20, showdiv=T, divcol="black", legendlab=c("A.unicolorB1","A.unicolorB2","A.unicolorB3","A.microunicolor","A.unicolorB4","A.unicolorA","A.unicolorB5","A.unicolorB6"),clustercol=c("#D12600","#DB6A00","#F5E400","#29BF12","#9CCADE","#00A5CF","#610052","#953272"))
dev.off()

# Make tiff image of plot with optimal K value
tiff(filename="STRUCTURE_AllIndividuals_K=8.tiff", height=550, width=1300)
plotQ(slist[9], showindlab=T, useindlab=T, sortind="all", returnplot=T, showsp=F, showlegend=T,indlabheight=0.3, basesize=10, legendkeysize=12,legendtextsize=20, showdiv=T, divcol="black", legendlab=c("A.unicolorB1","A.unicolorB2","A.unicolorB3","A.microunicolor","A.unicolorB4","A.unicolorA","A.unicolorB5","A.unicolorB6"),clustercol=c("#D12600","#DB6A00","#F5E400","#29BF12","#9CCADE","#00A5CF","#610052","#953272"))
dev.off()

### This process was later repeated for all UnicolorB STRUCTURE runs ###


