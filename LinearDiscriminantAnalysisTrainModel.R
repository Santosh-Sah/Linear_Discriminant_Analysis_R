source("LinearDiscriminantAnalysisUtils.R")
library(e1071)
library(caret)
library(MASS)

#reading training set 
linearDiscriminantAnalysisTrainingSet <- readRDS("LinearDiscriminantAnalysisTrainingSet.RDS")

#feature scaling
linearDiscriminantAnalysisTrainingSet[-14] = scale(linearDiscriminantAnalysisTrainingSet[-14])

#here I have taken 2 component.
linearDiscriminantAnalysis = lda(formula = Customer_Segment ~ ., data = linearDiscriminantAnalysisTrainingSet)

#applying LinearDiscriminantAnalysis on training set
linearDiscriminantAnalysisTrainingSet = as.data.frame(predict(linearDiscriminantAnalysis, linearDiscriminantAnalysisTrainingSet))

#arranging columns in required way
linearDiscriminantAnalysisTrainingSet = linearDiscriminantAnalysisTrainingSet[c(5, 6, 1)]

# Fitting LinearDiscriminantAnalysis with SupportVectorMachine to the Training set
linearDiscriminantAnalysisWithSupportVectorMachine = svm(formula = class ~ .,
                           data = linearDiscriminantAnalysisTrainingSet,
                           type = 'C-classification',
                           kernel = 'linear')

#saving LinearDiscriminantAnalysis with support vector machine model
saveLinearDiscriminantAnalysisWithSupportVectorMachineModel(linearDiscriminantAnalysisWithSupportVectorMachine)

#saving LinearDiscriminantAnalysis object
saveLinearDiscriminantAnalysis(linearDiscriminantAnalysis)
