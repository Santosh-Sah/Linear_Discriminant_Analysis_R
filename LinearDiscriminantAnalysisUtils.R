importLinearDiscriminantAnalysisDataset <- function(linearDiscriminantAnalysisDatasetFileName) {
  
  #importing dataset
  linearDiscriminantAnalysisDataset = read.csv(linearDiscriminantAnalysisDatasetFileName)
  
  #splitting the dataset into training set and testing set
  library(caTools)
  set.seed(1234)
  
  linearDiscriminantAnalysisDatasetSlpit = sample.split(linearDiscriminantAnalysisDataset$Customer_Segment, SplitRatio = 0.80)
  
  linearDiscriminantAnalysisTrainingSet = subset(linearDiscriminantAnalysisDataset, linearDiscriminantAnalysisDatasetSlpit == TRUE)
  
  linearDiscriminantAnalysisTestingSet = subset(linearDiscriminantAnalysisDataset, linearDiscriminantAnalysisDatasetSlpit == FALSE)
  
  
  returnList <- list(linearDiscriminantAnalysisTrainingSet, linearDiscriminantAnalysisTestingSet)
  
  return (returnList)
  
}

#saving training and testing set
saveTrainingAndTestingDataset <- function(linearDiscriminantAnalysisTrainingSet, linearDiscriminantAnalysisTestingSet){
  
  saveRDS(linearDiscriminantAnalysisTrainingSet, file = "LinearDiscriminantAnalysisTrainingSet.RDS")
  saveRDS(linearDiscriminantAnalysisTestingSet, file = "LinearDiscriminantAnalysisTestingSet.RDS")
  
}

#Save LinearDiscriminantAnalysis with SupportVectorMachine Model
saveLinearDiscriminantAnalysisWithSupportVectorMachineModel <- function(linearDiscriminantAnalysisWithSupportVectorMachineModel) {
  
  saveRDS(linearDiscriminantAnalysisWithSupportVectorMachineModel, file = "LinearDiscriminantAnalysisWithSupportVectorMachineModel.RDS")
}

#Save prediced values for testing set
saveLinearDiscriminantAnalysisPredictedValuesForTestingSet <- function(linearDiscriminantAnalysisPredictedValuesForTestingSet) {
  
  saveRDS(linearDiscriminantAnalysisPredictedValuesForTestingSet, file = "LinearDiscriminantAnalysisPredictedValuesForTestingSet.RDS")
}

#Save LinearDiscriminantAnalysis object
saveLinearDiscriminantAnalysis <- function(linearDiscriminantAnalysis) {
  
  saveRDS(linearDiscriminantAnalysis, file = "LinearDiscriminantAnalysis.RDS")
}
