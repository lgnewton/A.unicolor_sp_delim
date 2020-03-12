### Downloading bioclimatic variables from worldclim site by tile and then clipping them to include only geographic area of interest
### Modified script from https://emilypiche.github.io/BIO381/raster.html and Jim Starrett's Rtileraster.R script

# Load libraries needed for script; make sure to install them if not already installed
library(raster)
library(rgdal)
library(sp)
library(leaflet)
library(maps)

# Read csv file with Sample_ID, latitude, and longitude columns = will be data frame
Antro_lat_long <- read.csv('~/Desktop/Ch1_Antro_files/Maxent/Samples_33msl_no_outgroups.csv')

# Visualizing the coordinates for the samples; if error, may have to switch long and lat in circle markers
leaflet(data=Antro_lat_long) %>% 
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>% 
  addCircleMarkers(Antro_lat_long$Long, Antro_lat_long$Lat, label=as.character(Antro_lat_long$Sample_ID))

## Downloading the bioclimatic variables from worldclim at a resolution of 30 seconds (.5 minutes)
# Had to download 2 different tiles to fit the Antrodiaetus unicolor geographic range
r_antro <- getData("worldclim", var="bio", res=0.5, lon=-80, lat=45)
r_antro_2 <- getData("worldclim", var="bio", res=0.5, lon=-92, lat=35)

# Merge the 2 tiles into 1; will take a few minutes to complete - take a walk, call your mom
r_antro_merged <- mosaic(r_antro, r_antro_2, fun=mean)

# Optional - check that the object is a rasterbrick 
class(r_antro_merged)

# Optional - check how many layers are in the object (should be 19 = each bioclim variable)
nlayers(r_antro_merged)

# Lists information of the merged tile - class, dimensions, extent
unlist(r_antro_merged)

# Plot to visuaize what each climate layer of the merged tile looks like 
plot(r_antro_merged)

# Optional = visualize the geographic range of interest to see what area final raster file will cover
# Can help determine extent needed for final raster file
leaflet(data=Antro_lat_long) %>% 
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>% 
  addCircleMarkers(Antro_lat_long$Long, Antro_lat_long$Lat, label=as.character(Antro_lat_long$Sample_ID)) %>%
  addRectangles(
    lng1=min(Antro_lat_long$Long), lat1=min(Antro_lat_long$Lat),
    lng2=max(Antro_lat_long$Long), lat2=max(Antro_lat_long$Lat))

# Defines the extent of the range for Antrodiaetus unicolor
# You don't want to include too little or too much area (could potentially be misleading in subsequent niche-based distribution modeling)
#Antro_Range <- extent(-92.327, -76.647, 30.819, 40.506)  ##range too focused; needed to widen a bit
Antro_Range <- extent(-100, -70, 30, 45)

# Clip the merged tile to include only the extent of A. unicolor range 
BClim <- crop(r_antro_merged, Antro_Range)

# Plot to see if the study area is now limited to specified extent
plot(BClim)

# Makes an asc file for each variable = supported by MaxEnt
setwd('~/Desktop')
raster_Antro <- writeRaster(BClim, filename="Antro_merged_0.5.grd", format="ascii",bylayer=T, overwrite=T)

## Later will need to remove highly correlated layers to make a new file - figure out correlations using ENMTools
# Remove layers that are highly correlated (>=.90) with more than one variable, which I followed from Starrett et al. 2018 & Jeskova et al. 2011
r_antro_merged_nocorrelation <- dropLayer(r_antro_merged, c(1, 10, 11, 14, 17, 19))
raster_Antro_nocorrelation <- writeRaster(r_antro_merged_nocorrelation, filename="Antro_merged_0.5_nocor.grd", format="ascii",bylayer=T, overwrite=T)


