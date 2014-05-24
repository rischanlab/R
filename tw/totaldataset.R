#author    : Rischan Mafrur
#email		: rischanlab@gmail.com
#website	: rischanlab.github.io, ourmasjid.me 
#May 15, 2014

install.packages("ggplot2")


#data initiation
getwd()
setwd("E:\\RESEARCH\\twitter\\data\\csv")
list.files()
tolak <- read.csv("tolak_dataset.csv")
pilih <- read.csv("pilih_dataset.csv")

tolak
names(tolak) <-c("date","total_tweet")
names(pilih) <-c("date","total_tweet")


tolak$date <- as.Date( tolak$date, '%m/%d/%Y')
require(ggplot2)
ggplot( data = tolak, aes( tolak$date, tolak$total_tweet )) + geom_line() +
  theme(text = element_text(size=40),axis.text.x = element_text(angle=30, vjust=1)) +
  xlab("Date") +
  ylab("Total Tweets")

pilih$date <- as.Date( pilih$date, '%m/%d/%Y')
require(ggplot2)
ggplot( data = pilih, aes( pilih$date, pilih$total_tweet )) + geom_line() +
  theme(text = element_text(size=40),axis.text.x = element_text(angle=30, vjust=1)) +
  xlab("Date") +
  ylab("Total Tweets")