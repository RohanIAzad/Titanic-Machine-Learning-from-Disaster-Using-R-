setwd('C:/Users/Rohan/Desktop/titanic')

#Loading the datasets
train<-read.csv('C:/Users/Rohan/Desktop/titanic/train.csv')
test<-read.csv('C:/Users/Rohan/Desktop/titanic/test.csv')

#Viewing the datasets in table format
#View(train)
#View(test)

#Creating the survived column in test to merge with train
test$Survived<-NA
#merging train and test
combined_set<-rbind(train,test)

#the names are as factors. Changing them to characters
combined_set$Name<-as.character(combined_set$Name)

#Separating child and adult in Child column
combined_set$Child[combined_set$Age<14]<-'Child'
combined_set$Child[combined_set$Age>=14]<-'Adult'
table(combined_set$Child,combined_set$Survived)
combined_set$Child<-factor(combined_set$Child)

#Creating Mother column
combined_set$Mother<-'Not Mother'
combined_set$Mother[combined_set$Sex=='female' & combined_set$Parch>0 & combined_set$AGe>18]<-'Mother'
table(combined_set$Mother,combined_set$Survived)
combined_set$Mother<-factor(combined_set$Mother)
