# Multiple Linear Regression

# Importing the dataset

dataset=read.csv('insurance.csv')
#Displaying the count of null values per column
colSums(is.na(dataset))

# Missing data
#na. rm = TRUE to exclude missing values
dataset$bmi[is.na(dataset$bmi)]<-mean(dataset$bmi, na.rm=TRUE)
colSums(is.na(dataset))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library('caTools')
set.seed(123)
split=sample.split(dataset$charges,SplitRatio=.8)
training_set=subset(dataset,split==TRUE)
testing_set=subset(dataset,split==FALSE)
# Fitting Multiple Linear Regression to the Training set
regressor<-lm(formula=charges~.,data=training_set)
summary(regressor)
# Predicting the Validation set results

# case1. Predict how much a person of age 53, 
#bmi 36.6, 3 children, male, non smoker, from south-west how much need to pay? 
new<-data.frame(age=53,sex='male',bmi=36.6,children=3,smoker='no',region='southwest')
predict(regressor,new)
case2<-data.frame(age=62,sex='male',bmi=37.4,children=0,smoker='no',region='southwest')
predict(regressor,case2)
case3<-data.frame(age=19,sex='male',bmi=35.4,children=0,smoker='no',region='southwest')
predict(regressor,case3)
case4<-data.frame(age=50,sex='female',bmi=27.075,children=1,smoker='no',region='northeast')
predict(regressor,case4)
