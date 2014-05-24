#data initiation
getwd()
setwd("E:\\RESEARCH\\twitter\\data\\csv")
list.files()
webhistory <- read.csv("identify_data.csv", header=TRUE)
names(data)

install.packages("party",dependencies=TRUE)
#decision tree
install.packages("randomForest",dependencies=TRUE)

library(randomForest)
fit <- randomForest(data$user ~ data$academic+data$email
                    +data$socnet+data$porn+data$comic+data$music
                    +data$shop+data$blog+data$video+data$search
                    +data$news, data=data)
print(fit)
importance(fit)

fit <- randomForest(data$user ~ data$academic+data$email
                    +data$socnet+data$porn+data$comic+data$music
                    +data$shop+data$blog+data$video+data$search
                    +data$news+data$other, data=data)
print(fit)
importance(fit)

fit <- randomForest(data$user ~ data$academic+data$email
                    +data$socnet+data$comic+data$music
                    +data$shop+data$blog+data$video+data$search
                    +data$news+data$other, data=data)
print(fit)
importance(fit)



