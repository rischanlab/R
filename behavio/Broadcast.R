#Broadcast data anaylisis

#data initiation
getwd()
setwd("E:\\RESEARCH\\twitter\\data\\csv")
list.files()
broadcast <- read.csv("broadcast.csv", header=TRUE)
names(broadcast)

broadcast$personality <- NULL

library(randomForest)
fit <- randomForest(broadcast$user ~ broadcast$sumcallin+broadcast$caountcallin+broadcast$sumcallout+
                      broadcast$countcallout+broadcast$sumreceived+broadcast$countreceived+
                      broadcast$sumsent+broadcast$countsent, data=broadcast)
print(fit)
importance(fit)

broadcast$user <- NULL

fit <- randomForest(broadcast$personality ~ broadcast$sumcallin+broadcast$caountcallin+broadcast$sumcallout+
                      broadcast$countcallout+broadcast$sumreceived+broadcast$countreceived+
                      broadcast$sumsent+broadcast$countsent, data=broadcast)
print(fit)
importance(fit)


install.packages("fpc")
library(cluster)
library(fpc)

#K means

broadcast_kmean <- read.csv("broadcast.csv", header=TRUE)
broadcast_kmean$personality <- NULL
broadcast_kmean$user <- NULL
names(broadcast_kmean)

kc <- kmeans(broadcast_kmean,2)
#comparing result cluster to real value
table(broadcast$personality, kc$cluster)

kc
#plot cluster
plotcluster(broadcast_kmean, kc$cluster)

#more complex for ploting
clusplot(broadcast_kmean,kc$cluster,color=TRUE, 
         shade=FALSE,labels=0,lines=0)



