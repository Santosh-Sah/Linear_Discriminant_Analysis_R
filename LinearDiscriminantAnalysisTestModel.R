source("LinearDiscriminantAnalysisUtils.R")
library(e1071)
library(caret)
library(MASS)

#reading LinearDiscriminantAnalysis object
linearDiscriminantAnalysis <- readRDS("LinearDiscriminantAnalysis.RDS")

#reading testing set data
linearDiscriminantAnalysisTestingSet <- readRDS("LinearDiscriminantAnalysisTestingSet.RDS")

#feature scaling
linearDiscriminantAnalysisTestingSet[-14] = scale(linearDiscriminantAnalysisTestingSet[-14])

#applying LinearDiscriminantAnalysis on testing set
linearDiscriminantAnalysisTestingSet = as.data.frame(predict(linearDiscriminantAnalysis, linearDiscriminantAnalysisTestingSet))

#arranging columns in required way
linearDiscriminantAnalysisTestingSet = linearDiscriminantAnalysisTestingSet[c(5, 6, 1)]

#reading LinearDiscriminantAnalysis with support vector model
linearDiscriminantAnalysisWithSupportVectorModel = readRDS("LinearDiscriminantAnalysisWithSupportVectorMachineModel.RDS")

#predicting testing set result.
y_pred = predict(linearDiscriminantAnalysisWithSupportVectorModel ,newdata = linearDiscriminantAnalysisTestingSet[-3])

#Saving prediced values for testing set
saveLinearDiscriminantAnalysisPredictedValuesForTestingSet(y_pred)

