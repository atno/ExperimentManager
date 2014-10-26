
#' Initialize Experiment
#'
#' This function initialize the experiment. Creates a folder structure at the
#' specified path defined by <expPath>
#' 
#' @param expPath: the experiment absolute path 
#' @keywords ExperimentManager
#' @export
#' @examples
#' initExperiment()
#' 

initExperiment <- function(expPath)
{
    dataPath <- paste0(expPath, "data/" ) 
    spath <- paste0(expPath, "myScriptList/" )
        
    # init structure
    if( ! my.dir.exists(expPath) )
    {   print( paste("initializing experiment in ", expPath))
        
        dir.create( expPath, recursive = TRUE)
        dir.create( dataPath )
        dir.create( spath )
        
        dput(0, file=paste0(expPath,"cc.txt"))
        print( "done!")
    }
    
    d <- c(expPath, dataPath, spath )
}
    



    
#' Run Experiment
#'
#' This function creates a new experiment run: 
#'  1. makes a backup of the script code 
#'  2. stores results
#'  3. stores results and additional information
#' 
#' @param d: the experiment definition; file the script filename; description: a string description of the run features
#' @keywords ExperimentManager
#' @export
#' @examples
#' runExp()
#' 
runExp <- function(d, file, description )
{
    expPath <- d[1] 
    dataPath <- d[2] 
    spath <- d[3] 
    
    if( length(dir(dataPath)) == 0  )
    {  stop( paste("App_Error: No data in data-folder!" ))
    }
    
    if( ! file.exists( paste0(spath,file) ))
    {  stop( paste("Script file not found: ", file, "does not exist in folder ", spath ))
    }        
    
    # run id
    id_run <- dget(paste0(expPath,"cc.txt"))   
    dput(id_run+1, file=paste0(expPath,"cc.txt")) 
    
    # run destination path
    id_run <- formatC(id_run, width = 3, format = "d", flag = "0") 
    dpath <- paste0(expPath,"run",id_run," ",description,"/")
    dir.create(dpath)
    
    # setwd
    setwd( dpath)
    
    # save current date
    dput( date(), file=paste0(dpath,"date.txt")) 
    
    # create empty file to store kaggle scores (public and provare leaderboard)
    dput( "", file=paste0(dpath,"Kaggle.txt")) 
    dput( "", file=paste0(dpath,"Kaggle_private.txt")) 
    
	# store description string on file
	dput( description, file=paste0(dpath,"description.txt")) 
    
    # copy
    file.copy( paste0(spath,file), paste0(dpath,file,".back") )

    # source
    source( paste0(file,".back") , local=TRUE )       
}    




my.dir.exists <- function(d) 
{   de <- file.info(d)$isdir
    ifelse(is.na(de), FALSE, de)
}
