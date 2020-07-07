setwd('C:/Users/Rohan/Desktop/titanic')
#Loading training and test set
train <- read.csv('C:/Users/Rohan/Desktop/titanic/train.csv')
test <- read.csv('C:/Users/Rohan/Desktop/titanic/test.csv')

#View(train)
#View(test)
#Getting a count of how many people survivded or died ina table format

table(train$Survived)

# Getting in percentage format
prop.table(table(train$Survived))
prop.table(table(train$Survived)) * 100

#Creating a column of survivded with "0" as the values,meaning no one survived
test$Survived <- rep(0,418)           

#Creating submission file
prediction1<- data.frame(PassengerId=test$PassengerId,Survived=test$Survived)
write.csv(prediction1,file='1stprediciton.csv',row.names=FALSE)
