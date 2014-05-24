
#this code from http://www.r-bloggers.com/k-means-clustering-on-big-data/
# rxCluster Example
library(ggplot2)

# Get small Census data file
sampleDataDir <- rxGetOption("sampleDataDir")
head(sampleDataDir)
dataFile <- file.path( sampleDataDir, "CensusWorkers")
head(dataFile)
rxGetInfoXdf(dataFile, getVarInfo=TRUE)
head(rxGetInfoXdf)
# Create an Xdf file to run rxKeans
rxDataStepXdf(inFile=dataFile, outFile="AgeInc", 
              varsToKeep = c("age","incwage"),overwrite=TRUE)
rxGetInfoXdf("AgeInc", getVarInfo=TRUE, numRows=3)

# Run rxKmeans
clust <- rxKmeans(~ age + incwage,data= "AgeInc",numClusters = 4, algorithm = "lloyd", 
                  outFile = "AgeInc", outColName = "Cluster", overwrite = TRUE) 

clust
# Plot Data and cluster centers
DF <- rxXdfToDataFrame(file="AgeInc")
DF$Cluster <- factor(DF$Cluster)
names(DF) <- c("Age","Income","Cluster")
p <- ggplot() + geom_point(data=DF,aes(x=Age,y=Income,colour=Cluster))
DF2 <- as.data.frame(clust$centers)
names(DF2) <- c("X","Y")
layer2 <- geom_point(data=DF2, aes(x=X,y=Y))
p + layer2