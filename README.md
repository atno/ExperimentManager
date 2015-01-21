Experiment Manager
=================

* this R package makes simple to version control your quick-and-erratic experiments by keeping a full history of the code script along with the results and the console outputs.
* You will be able to go back and look at previous experiments, retrieve all the results along with the exact code version used to generate them.
* The ideal tool to keep track of your experiments in a Kaggle competition.


How to install
=============
Install the package directly from this repo via the R command:
```
devtools::install_github("atno/ExperimentManager")
```

How to use
==========

```{R}
# install package
devtools::install_github("atno/ExperimentManager")

# load the ExperimentManager library
library(ExperimentManager)

# define a base path for the experiment
basepath <- "C:/Kaggle/CompetitionXY/myRunsLocalRepo/"

## initialize a new experiment with a base path
expd <- initExperiment( basepath )

## copy a demo script and dataset
fileUrl <- 'https://raw.githubusercontent.com/atno/ExperimentManager/master/sample/sampleTrain.csv'
download.file(fileUrl, destfile = paste0(basepath,"data/", "sampleTrain.csv") )
fileUrl = 'https://raw.githubusercontent.com/atno/ExperimentManager/master/sample/sampleScript.R'
download.file(fileUrl, destfile = paste0(basepath,"myScriptList/","sampleScript.R") )

## Let's start playing: run a batch of experiements
runExp(expd, "sampleScript.R",  description = "sample execution" )
runExp(expd, "sampleScript.R",  description = "sample execution v2" )
runExp(expd, "sampleScript.R",  description = "sample execution v2" )
```

download this sample script here [ExperimentManager_usage_example.R](https://raw.githubusercontent.com/atno/ExperimentManager/master/sample/ExperimentManager_usage_example.R)

