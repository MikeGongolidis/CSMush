library(ggplot2) # Data visualization
library(readr) # CSV file I/O, e.g. the read_csv function
library(caret)
library(randomForest)
library(caTools)   #<- For stratified split
library(rpart.plot)

library(gridExtra)
train01<-read.csv("mushrooms_v2.csv")
mushrooms <- train01
mushrooms$class <- NULL
names <- colnames(mushrooms)
z<-cbind.data.frame(Var=names(train01), Total_Class=sapply(train01,function(x){as.numeric(length(levels(x)))}))
print(z)



set.seed(12) 
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
gbm<-train(x=x_train,y=y_train,method="gbm", trControl=ctrl.1,tuneLength=3,verbose=FALSE)

plot(gbm,main="Gradient Boosting Model ")
y_predicted<-predict(gbm,x_test)

df1<-data.frame(Orig=y_test,Pred=y_predicted)

confusionMatrix(table(df1$Orig,df1$Pred))
#RPART

rpart <-train(x=x_train,y=y_train,method="rpart",trControl=ctrl.1,tuneLength=5)
plot(varImp(rpart),main="RPart - Variable Importance Plot")
plot(rpart,main="RPart")
rpart.plot(rpart$finalModel) 

y_predicted<-predict(rpart,x_test)

df1<-data.frame(Orig=y_test,Pred=y_predicted)

confusionMatrix(table(df1$Orig,df1$Pred))
#RANDOM FOREST

rf<-train(x=x_train,y=y_train,method="rf",trControl=ctrl.1,tuneLength=3)
summary(rf) #acc =0.8907171
plot(varImp(rf),main="Random Forest - Variable Importance Plot")



y_predicted<-predict(rf,x_test)

df1<-data.frame(Orig=y_test,Pred=y_predicted)

confusionMatrix(table(df1$Orig,df1$Pred))  

# TEST HERE OUR WORK

test_variable <- mushrooms[1322,]
predict(mod3,test_variable)

#y = data.frame("a","b","f","f","f","f","a","b","f","f","f","f","a","b","f","f","f","f","a","b","f","f")
#names(y)<- names
#predict(rf.1.cv,y)


###############################
#  PLOTS                      #
###############################

m1 <- ggplot(aes(x = cap.shape), data = mushrooms) +
  geom_histogram(stat = "count") +
  facet_wrap(~class) +
  xlab("Cap Shape")

m2 <- ggplot(aes(x = cap.surface), data = mushrooms) +
  geom_histogram(stat = "count") +
  facet_wrap(~class) +
  xlab("Cap Surface")

m3 <- ggplot(aes(x = cap.color), data = mushrooms) +
  geom_histogram(stat = "count") +
  facet_wrap(~class) +
  xlab("Cap Color")

m4 <- ggplot(aes(x = bruises), data = mushrooms) +
  geom_histogram(stat = "count") +
  facet_wrap(~class) +
  xlab("Bruises")

m5 <- ggplot(aes(x = odor), data = mushrooms) +
  geom_histogram(stat = "count") +
  facet_wrap(~class) +
  xlab("Odor")

grid.arrange(m1, m2, m3, ncol = 2)
grid.arrange(m4,m5,ncol=2)

p = ggplot(mushrooms,aes(x=odor,  
                    y=spore.print.color, 
                    color=class))

p + geom_jitter(alpha=0.3) +  
  scale_color_manual(breaks = c('Edible','Poisonous'),
                     values=c('darkgreen','red'))
