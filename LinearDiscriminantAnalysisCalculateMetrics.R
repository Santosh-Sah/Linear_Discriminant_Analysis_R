source("LinearDiscriminantAnalysisUtils.R")
library(e1071)
library(caret)
library(MASS)

#reading LinearDiscriminantAnalysis object
linearDiscriminantAnalysis <- readRDS("LinearDiscriminantAnalysis.RDS")

#reading testing set data
linearDiscriminantAnalysisTestingSet <- readRDS("linearDiscriminantAnalysisTestingSet.RDS")

#feature scaling
linearDiscriminantAnalysisTestingSet[-14] = scale(linearDiscriminantAnalysisTestingSet[-14])

#applying LinearDiscriminantAnalysis on testing set
linearDiscriminantAnalysisTestingSet = as.data.frame(predict(linearDiscriminantAnalysis, linearDiscriminantAnalysisTestingSet))

#arranging columns in required way
linearDiscriminantAnalysisTestingSet = linearDiscriminantAnalysisTestingSet[c(5, 6, 1)]

#reading predicted values of the testing set
linearDiscriminantAnalysisPredictedValuesForTestingSet <- readRDS("LinearDiscriminantAnalysisPredictedValuesForTestingSet.RDS")

linearDiscriminantAnalysisConfusionMatrix = table(linearDiscriminantAnalysisTestingSet[, 3], linearDiscriminantAnalysisPredictedValuesForTestingSet)

linearDiscriminantAnalysisConfusionMatrix

#    1  2  3
# 1 12  0  0
# 2  0 14  0
# 3  0  0 10