#author		: Rischan Mafrur
#email		: rischanlab@gmail.com
#website	: rischanlab.github.io, ourmasjid.me 
#May 15, 2014


#Data Manipulation

getwd()
setwd("E:\\RESEARCH\\twitter\\data\\csv")
list.files()
tolak <- read.csv("TolakPartai.csv")
dim(tolak)
head(tolak,2)
length(tolak)

tolak[2:3,5:10]
tolak[,1]
names(tolak)
tolak$tweet_rate
mean(tolak$tweet_rate)
head(tolak[c(-1)])
head(tolak)

#removing column
tolak$Name <- NULL
names(tolak)

#SVM
head(tolak)
#install packages
install.packages("e1071", dep = TRUE) 



#find help for svm
?svm

head(tolak)
install.packages("kernlab", dep = TRUE) 
library("kernlab")

#load data
head(tolak)
tolak$Name <- NULL
head(tolak)

svm_model <- ksvm(Account ~ ., data = tolak,
                  type = "C-bsvc", kernel = "rbfdot", 
                  kpar = list(sigma = 0.1), C=10, 
                  prob.model = TRUE)

summary(svm_model)


#load library
library("e1071")
head(tolak)

svm_model <- svm(Account ~ ., data = tolak,
                 method = "C-classification", 
                 kernel="radial", cost = 10, gamma =0.1)
summary(svm_model)

plot(svm_model, tolak, Followers ~ mention_ratio)
