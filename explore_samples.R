
##########################################
#        Visualize trees samples         #
##########################################

# Data exploration

# setup environment
path<-getwd();
workingDir <-paste(path,'Documents/Genomics_analysis/Arboretum/RandomArboretum',sep="/")
setwd(workingDir)
getwd();

library(readxl)
library(mapview)
library(ggplot2)

options(stringsAsFactors = FALSE);
Data <- read_excel("data/TGDR191_files/TGDR191_Tree_Accession.xlsx")
summary(Data)

# plot trees map location
pal = mapviewPalette( "mapviewTopoColors")

mapview(Data, xcol = "Longitude", ycol = "Latitude", 
        zcol="Species",col.regions=pal(4), # CRS: Coordinate Reference System
        crs = 4326, grid = FALSE) # 4326 or 4269 works fine

# plot histogram
ggplot(Data, aes(x=Species)) + 
  stat_count(width = 0.5) +
  labs(title="Species histogram plot",x="Species", y = "Count") +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_bar(fill = pal(4))

