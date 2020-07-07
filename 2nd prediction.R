setwd('C:/Users/Rohan/Desktop/titanic')

#Loading training and test set
train<-read.csv('C:/Users/Rohan/Desktop/titanic/train.csv')
test<-read.csv('C:/Users/Rohan/Desktop/titanic/test.csv')

#Looking for Male and Female numbers
summary(train$Sex)
prop.table(table(train$Sex))
prop.table(table(train$Sex))*100

#Craeting a barplot of males and females
barplot(table(train$Sex),xlab='Pasenger',ylab='People',main='Train Data Passenger')

#Setting all the females survivded in the test set
test$Survived<-0
test$Survived[test$Sex=='female']<-1

#Creating submission file
prediction2 = data.frame(PassengerId=test$PassengerId,Survived =test$Survived)
write.csv(prediction2,file='2ndprediction.csv',row.names=FALSE)
