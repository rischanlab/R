#author		: Rischan Mafrur
#email		: rischanlab@gmail.com
#website	: rischanlab.github.io, ourmasjid.me 
#May 15, 2014

#install requirement packages
install.packages("klaR")
install.packages("caret")

#loading library
library("klaR")
library("caret")


#data initiation
getwd()
setwd("E:\\RESEARCH\\twitter\\data\\csv")
list.files()
data <- read.csv("dataset_train.csv")
names(data) <-c("followers","followings","num_tweets",
                "tweet_rate","age","hashtag_ratio",
                "mention_ratio","reputation","API_ratio",
                "URL_ratio","account")
names(data)

x = data[,-11]
y = data$account

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

#plotting the result
mN <- NaiveBayes(data$account ~ ., data = data)
plot(mN)
mK <- NaiveBayes(data$account ~ ., data = data, usekernel=TRUE)
plot(mK)



#test iris data

data(iris)
x <- iris[sample(1:nrow(iris)),] ## flowers are in order by species!
plot(x, col=x$Species)

## make the data a little messy
x <- cbind(x, useless = rnorm(nrow(x)))
x[,1] <- x[,1] + rnorm(nrow(x))
x[,2] <- x[,2] + rnorm(nrow(x))
x[,3] <- x[,3] + rnorm(nrow(x))

plot(x, col=x$Species)
head(x)

train <- x[1:100,] 
test <- x[101:150,]

head(train)
head(test)
