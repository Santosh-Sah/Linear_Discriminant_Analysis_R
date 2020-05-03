source("LinearDiscriminantAnalysisUtils.R")
library(e1071)
library(caret)
library(MASS)

#I am taking new observation from the testing set on for simplicity.
#I could have created new observation and predict. I am taking records from testing set as a new observation for simplicity.

#reading LinearDiscriminantAnalysis object
linearDiscriminantAnalysis <- readRDS("LinearDiscriminantAnalysis.RDS")

#reading testing set data
linearDiscriminantAnalysisTestingSet <- readRDS("LinearDiscriminantAnalysisTestingSet.RDS")

#taking only two records from the testing set.
#we can create new data frame to predict
linearDiscriminantAnalysisTestingSet <- linearDiscriminantAnalysisTestingSet[2:3,]

#feature scaling
linearDiscriminantAnalysisTestingSet[-14] = scale(linearDiscriminantAnalysisTestingSet[-14])

#applying LinearDiscriminantAnalysis on new observation
linearDiscriminantAnalysisTestingSet = as.data.frame(predict(linearDiscriminantAnalysis, linearDiscriminantAnalysisTestingSet))

#arranging columns in required way
linearDiscriminantAnalysisTestingSet = linearDiscriminantAnalysisTestingSet[c(5, 6, 1)]

#reading LinearDiscriminantAnalysis with support vector model
linearDiscriminantAnalysisWithSupportVectorModel = readRDS("LinearDiscriminantAnalysisWithSupportVectorMachineModel.RDS")

#predicting testing set result.
y_pred = predict(linearDiscriminantAnalysisWithSupportVectorModel ,newdata = linearDiscriminantAnalysisTestingSet[-3])

y_pred
