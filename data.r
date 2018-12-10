library(ggplot2) # Data visualization
library(readr) # CSV file I/O, e.g. the read_csv function
library(caret)
library(randomForest)
library(caTools)   #<- For stratified split
library(rpart.plot)

train01<-read.csv("mushrooms_v2.csv")
mushrooms <- train01
mushrooms$class <- NULL
names <- colnames(mushrooms)
z<-cbind.data.frame(Var=names(train01), Total_Class=sapply(train01,function(x){as.numeric(length(levels(x)))}))
print(z)



set.seed(121) 
sample = sample.split(train01$class, SplitRatio = .7)
x_train = subset(train01, sample == TRUE)
x_test = subset(train01, sample == FALSE)

#__________________________

y_train<-x_train$class
y_test <- x_test$class


x_train$class<-NULL
x_test$class<-NULL

# Create a stratified sample for repeated cv
cv.10.folds<-createMultiFolds(y_train,k=10,times=2)

# create a control object for repeated cv in caret
ctrl.1<-trainControl(method="repeatedcv",number=10,repeats=2,index=cv.10.folds)

#GBM
#mod2<-train(x=x_train,y=y_train,method="gbm", trControl=ctrl.1,tuneLength=3,verbose=FALSE)

#RPART

mod3 <-train(x=x_train,y=y_train,method="rpart",trControl=ctrl.1,tuneLength=5)
#plot(varImp(mod3),main="RPart - Variable Importance Plot")
#RANDOM FOREST

rf.1.cv<-train(x=x_train,y=y_train,method="rf",trControl=ctrl.1,tuneLength=3)
#summary(rf.1.cv) acc =0.8907171
#plot(varImp(rf.1.cv),main="Random Forest - Variable Importance Plot")



#y_predicted<-predict(rf.1.cv,x_test)

#df1<-data.frame(Orig=y_test,Pred=y_predicted)

#confusionMatrix(table(df1$Orig,df1$Pred))  #<-100% accuracy

#RPART

#mod3 <-train(x=x_train,y=y_train,method="rpart",trControl=ctrl.1,tuneLength=5)
#plot(varImp(mod3),main="RPART - Variable Importance Plot")

#rpart.plot(mod3$finalModel) 
#install.packages("rattle")
#library(rattle)
#fancyRpartPlot(mod3$finalModel,main="Mushroom Attributes Classification",sub=NA,
         #      palettes=c("Greys","Oranges"))

# TEST HERE OUR WORK

test_variable <- mushrooms[1322,]
predict(mod3,test_variable)

#y = data.frame("a","b","f","f","f","f","a","b","f","f","f","f","a","b","f","f","f","f","a","b","f","f")
#names(y)<- names
#predict(rf.1.cv,y)
