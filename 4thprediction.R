setwd('C:/Users/Rohan/Desktop/titanic')

#Loading the datasets
train<-read.csv('C:/Users/Rohan/Desktop/titanic/train.csv')
test<-read.csv('C:/Users/Rohan/Desktop/titanic/test.csv')

#Viewing the datasets in table format
#View(train)
#View(test)

#installing necessary packages
install.packages('rattle')
install.packages('rpart.plot')
install.packages('RColorBrewer')
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

mytree3 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data=train, method="class")
plot(mytree3)
text(mytree3)
fancyRpartPlot(mytree3)

prediction4th<-data.frame(PassengerId=test$PassengerId,Survived=test$Survived)
write.csv(prediction4th,file='4thprediction.csv',row.names=FALSE)
