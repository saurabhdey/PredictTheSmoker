
combo <-read.table("C:/Users/shubhro/Programming/Rprogramming/swissdata/mlogx.txt", header=TRUE,
             fill=TRUE,sep="\t",colClasses=c("character","character","character","character","character",
             "character","numeric","numeric","character","numeric","numeric","character","numeric","factor","numeric"))


# Split data into test and training randomly
library(caret)
set.seed(825)
inTraining <- createDataPartition(combo$Smokerstatus, p = 0.70, list = FALSE)
trainset <- combo[inTraining,]
testset <- combo[-inTraining,]


#===========================================GBMstart============================================


#fitControlgb <- trainControl( 
#        method = "repeatedcv",
#        number = 10,
###### repeated ten times
#        repeats = 10,
#        classProbs = TRUE)


#set.seed(825)
#gbmFit <- train(Smokerstatus~AgeD+Gender+State,data = trainset,  
#                 method = "gbm",
#                 trControl = fitControlgb,
                 ## This last option is actually one
                 ## for gbm() that passes through
#                 verbose = FALSE)

#gbmod = predict(gbmFit,newdata=testset)
#confusionMatrix(gbmod,testset$Smokerstatus,positive="S")

#===========================================GBMend============================================

#===========================================SVMstart============================================

#fitControlsv <- trainControl(## 10-fold CV
#        method = "repeatedcv",
#        number = 10,
## repeated ten times
#        repeats = 10,
#        classProbs = TRUE)


#set.seed(825)
#svmFit <- train(Smokerstatus~Age+Agecategory+Gender+Proposed.Client.Face.Amt, data = trainset,
#                method = "svmRadial",
#                trControl = fitControlsv,
#                preProc = c("center", "scale"),
#                tuneLength = 8,
#                metric = "ROC")
#svmFit

#prediction <- predict(model, testset$Smokerstatus)
#===========================================SVMend=================================================


#===========================================Logitstart============================================
#logitFit = glm(Smokerbin~AgeD+as.factor(Gender)+as.factor(State)+LnPCFA,data=trainset,family=binomial("logit"))
#logitest = predict(logitmod1,newdata = testset) 
#===========================================Logitend============================================


#===========================================BoostTree============================================

#fitControlad <- trainControl(## 10-fold CV
#        method = "repeatedcv",
#        number = 10,
########### repeated ten times
#        repeats = 10,
#        classProbs = TRUE)

#set.seed(825)
#adafit <- train(Smokerstatus~AgeD+Gender+State+LnPCFA, data = trainset,
#                method = "ada",
#                trControl = fitControlad)

#blkfit <- train(Smokerstatus~AgeD+Gender+State, data = trainset,
#                method = "blackboost",
#                trControl = fitControlad)


#===========================================BoostTreend============================================

#===========================================RFstart===========================================
#set.seed(825)
#fitControlrf <- trainControl(method = "oob")

#fitControlob <- trainControl(## 10-fold CV
#        method = "repeatedcv",
#        number = 10,
########### repeated ten times
#        repeats = 10,
#        classProbs = TRUE)


#rforest <- train(Smokerstatus~AgeD+Gender+State,data=trainset,
#                method = "rf",
#                trControl = fitControlrf)


#===========================================RFend=========================================================


