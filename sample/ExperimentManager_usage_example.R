# load the ExperimentManager library
library(ExperimentManager)

# set a base path for the experiments
basepath <- "C:/Kaggle/CompetitionXY/myRunsLocalRepo/"

## initialize the experiment with a base path
expd <- initExperiment( basepath )

## copy data in the data folder
dataFile <- "sampleTrain.csv" 
fileUrl <- 'https://raw.githubusercontent.com/atno/ExperimentManager_sample/master/sampleTrain.csv'
download.file(fileUrl, destfile = paste0(basepath,"data/",dataFile) )

## copy R script in the script folder
scriptFile <- "sampleScript.R"
fileUrl = 'https://raw.githubusercontent.com/atno/ExperimentManager_sample/master/sampleScript.R'
download.file(fileUrl, destfile = paste0(basepath,"myScriptList/",scriptFile) )


## run a batch of experiements
runExp(expd, "sampleScript.R",  description = "sample execution" )
runExp(expd, "sampleScript.R",  description = "sample execution v2" )
runExp(expd, "sampleScript.R",  description = "sample execution v3" )




