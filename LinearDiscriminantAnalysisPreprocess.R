source("LinearDiscriminantAnalysisUtils.R")

linearDiscriminantAnalysisDatasetList <- importLinearDiscriminantAnalysisDataset("Linear_Discriminant_Analysis_Wines.csv")

saveTrainingAndTestingDataset(linearDiscriminantAnalysisDatasetList[[1]], linearDiscriminantAnalysisDatasetList[[2]])
