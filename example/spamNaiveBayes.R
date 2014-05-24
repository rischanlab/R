#author		: Rischan Mafrur
#email		: rischanlab@gmail.com
#website	: rischanlab.github.io, ourmasjid.me 
#May 15, 2014

install.packages('ElemStatLearn')
library('ElemStatLearn')
library("klaR")
library("caret")

sub = sample(nrow(spam), floor(nrow(spam) * 0.9))
sub
head (sub)
names(sub)
train = spam[sub,]
test = spam[-sub,]

train
test

xTrain = train[,-58]
yTrain = train$spam

xTrain
yTrain

xTest = test[,-58]
yTest = test$spam

xTest
yTest

model = train(xTrain,yTrain,'nb',trControl=trainControl(method='cv',number=10))

prop.table(table(predict(model$finalModel,xTest)$class,yTest))