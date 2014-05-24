#author  	: Rischan Mafrur
#email		: rischanlab@gmail.com
#website	: rischanlab.github.io, ourmasjid.me 
#May 15, 2014




#data initiation
getwd()
setwd("E:\\RESEARCH\\twitter\\data\\csv")
list.files()
tolak <- read.csv("tolak_tw_rt.csv")
pilih <- read.csv("pilih_tw_rt.csv")

names(tolak) <-c("tweet","retweet")
names(pilih) <-c("tweet","retweet")

head(tolak)
head(pilih)

summary(tolak)
summary(pilih)

library(plyr)

sum(tolak$tweet)
sum(tolak$retweet)
sum(tolak$tweet,tolak$retweet)
sum(pilih$tweet)
sum(pilih$retweet)
sum(pilih)

sum(tolak,pilih)

boxplot(tolak,main="Tweets & Retweets Distribution 
#TolakPartaiPoligami hashtag", ylab="Number of Tweets or Retweets each day")

boxplot(pilih,main="Tweets & Retweets Distribution 
#SayaPilihPKS hashtag", ylab="Number of Tweets or Retweets each day")
