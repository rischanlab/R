#author		: Rischan Mafrur
#email		: rischanlab@gmail.com
#website	: rischanlab.github.io, ourmasjid.me 
#May 15, 2014

#install requirement packages
install.packages("klaR")
install.packages("caret")
install.packages("plotrix")

#loading library
library("klaR")
library("caret")


#set the working directory
getwd()
setwd("E:\\RESEARCH\\twitter\\data\\csv")

#listing file like 'ls'
list.files()

#data initiation
data_train <- read.csv("dataset_train.csv")
test_tolakpartai <- read.csv("testing_TolakPartai.csv")
test_sayapilih <- read.csv("testing_SayaPilihPKS.csv")

#if you wanna to destroy the objects
test_sayapilih <- NULL
test_tolakpartai <- NULL

#Because the dataset doesent have title/caption so I give the title/names for each columns
names(data_train) <-c("followers","followings","num_tweets",
                "tweet_rate","age","hashtag_ratio",
                "mention_ratio","reputation","API_ratio",
                "URL_ratio","account")

names(test_tolakpartai) <-c("followers","followings","num_tweets",
                      "tweet_rate","age","hashtag_ratio",
                      "mention_ratio","reputation","API_ratio",
                      "URL_ratio")

names(test_sayapilih) <-c("followers","followings","num_tweets",
                            "tweet_rate","age","hashtag_ratio",
                            "mention_ratio","reputation","API_ratio",
                            "URL_ratio")

names(data_train)
names(test_tolakpartai)
names(test_sayapilih)


#initiation training data
x = data_train[,-11]
y = data_train$account

x1 = test_tolakpartai
x2 = test_sayapilih

head(x1)
head(x2)

#creating naive bayes model 
#k-fold cross validation with k=10

model = train(x,y,'nb',
              trControl=trainControl(method='cv',number=10))

#any warning we can see with warning command
warnings()

#print out the model

model

#using model for predicting
#show value
predict(model$finalModel,x)
#show prediction class, in this case real account and campaign account
predict(model$finalModel,x)$class

#generate confusion matrix table
table(predict(model$finalModel,x)$class,y)

#Tolak Partai Poligami
predict(model,x1)
result_tolak <- predict(model$finalModel,x1)$class
#adding column to data x1
x1$account <- result_tolak

#generate confusion matrix for Tolak Partai Poligami hashtag
y1 = x1$account
table(predict(model$finalModel,x1)$class,y1)

library(plyr)
count(x1$account)
nrow(x1)

plot(x1$account)
library(plotrix)

#Ploting the data to Pie Chart
slices <- c(6621,3030) 
lbls <- c("campaign accounts", "real account")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie3D(slices,labels = lbls, col=rainbow(length(pct)),
    main="Pie Chart of #TolakPartaiPoligami hashtag")


#plotting the result of Tolak Partai Poligami
tolak_mN <- NaiveBayes(x1$account ~ ., data = x1)
plot(tolak_mN)
tolak_mK <- NaiveBayes(x1$account ~ ., data = x1, usekernel=TRUE)
plot(tolak_mK)


#Saya Pilih PKS
predict(model,x2)
result_pilih <- predict(model$finalModel,x2)$class
#adding column to data x1
x2$account <- result_pilih


library(plyr)
count(x2$account)
nrow(x2)

plot(x2$account)
library(plotrix)

slices <- c(2334,3305) 
lbls <- c("campaign accounts", "real account")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie3D(slices,labels = lbls, col=rainbow(length(pct)),
      main="Pie Chart of #SayaPilihPKS hashtag")



plot(x2$account)
#plotting the result of Tolak Partai Poligami
pilih_mN <- NaiveBayes(x2$account ~ ., data = x2)
plot(pilih_mN)
pilih_mK <- NaiveBayes(x2$account ~ ., data = x2, usekernel=TRUE)
