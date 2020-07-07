setwd('C:/Users/Rohan/Desktop/titanic')

#Loading the datasets
train<-read.csv('C:/Users/Rohan/Desktop/titanic/train.csv')
test<-read.csv('C:/Users/Rohan/Desktop/titanic/test.csv')

#Viewing the datasets in table format
#View(train)
#View(test)

#grouping different ranges of fairs and creating "Fare2"
train$Fare2[train$Fare>30] <- '30+'
train$Fare2[train$Fare<=30 & train$Fare>=20] <- '20-30'
train$Fare2[train$Fare<20 & train$Fare>=10] <- '10-20' 
train$Fare2[train$Fare<10] <- '<10'

# when combining more than 2 columns ina table it is better to use "Aggregate"
aggregate(Survived~Fare2+Pclass+Sex,data=train,FUN=sum)
aggregate(Survived~Fare2+Pclass+Sex,data=train,FUN=length)
aggregate(Survived~Fare2+Pclass+Sex,data=train,FUN=function(x){sum(x)/length(x)})

#Creating test set predictions
test$Survived<-0 #everyone dies
test$Survivded[test$Sex=='female']<-1
test$Survived[test$Sex=='female'&test$Pclass==3 &test$Fare>=20]

#Creating submission file
prediction3rd<-data.frame(PassengerId=test$PassengerId,Survived=test$Survived)
write.csv(prediction3rd,file='3rdprediction.csv',row.names=FALSE)
