source("LinearDiscriminantAnalysisUtils.R")
library(ggplot2)
library(ElemStatLearn)
library(caret)
library(e1071)
library(MASS)

#reading training set 
linearDiscriminantAnalysisTrainingSet <- readRDS("LinearDiscriminantAnalysisTrainingSet.RDS")

#reading testing set data
linearDiscriminantAnalysisTestingSet <- readRDS("LinearDiscriminantAnalysisTestingSet.RDS")

#reading LinearDiscriminantAnalysis with support vector model
linearDiscriminantAnalysisWithSupportVectorModel = readRDS("LinearDiscriminantAnalysisWithSupportVectorMachineModel.RDS")

#visualizing training set result
#It will take huge memory. If the system is not advance it will give memory error
visualisingTrainingSetResult <- function(linearDiscriminantAnalysisTrainingSet, linearDiscriminantAnalysisWithSupportVectorModel){
  
  set = linearDiscriminantAnalysisTrainingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('x.LD1', 'x.LD2')
  y_grid = predict(linearDiscriminantAnalysisWithSupportVectorModel, newdata = grid_set)
  plot(set[, -3],
       main = 'Linear Discriminant Analysis TrainingSet with support vector machine (Training set)',
       xlab = 'LD1', ylab = 'LD2',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 2, 'deepskyblue', ifelse(y_grid == 1, 'springgreen3', 'tomato')))
  points(set, pch = 21, bg = ifelse(set[, 3] == 2, 'blue3', ifelse(set[, 3] == 1, 'green4', 'red3')))
  
  
  ggsave("LinearDiscriminantAnalysisTrainingsetResult.png")
  
}

#visualizing testing set result
visualisingTestingSetResult <- function(linearDiscriminantAnalysisTestingSet, linearDiscriminantAnalysisWithSupportVectorModel){
  
  set = linearDiscriminantAnalysisTestingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('x.LD1', 'x.LD2')
  y_grid = predict(linearDiscriminantAnalysisWithSupportVectorModel, newdata = grid_set)
  plot(set[, -3], main = 'LinearDiscriminantAnalysis with SVM (Test set)',
       xlab = 'LD1', ylab = 'LD2',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 2, 'deepskyblue', ifelse(y_grid == 1, 'springgreen3', 'tomato')))
  points(set, pch = 21, bg = ifelse(set[, 3] == 2, 'blue3', ifelse(set[, 3] == 1, 'green4', 'red3')))
  
  
  ggsave("LinearDiscriminantAnalysisTestingsetResult.png")
  
}

#visualisingTrainingSetResult(linearDiscriminantAnalysisTrainingSet, linearDiscriminantAnalysisWithSupportVectorModel)
visualisingTestingSetResult(linearDiscriminantAnalysisTestingSet, linearDiscriminantAnalysisWithSupportVectorModel)