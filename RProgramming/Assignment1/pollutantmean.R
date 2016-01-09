pollutantmean <- function(directory, pollutant, idVector = 1:332) {
    
    theSum  <- 0. 
    nValues <- 0.
    for(id in idVector){
        fileName = toString(id)
        if(id < 10)  fileName <- paste("0",fileName,sep="")
        if(id < 100) fileName <- paste("0",fileName,sep="")
        fileData <- read.csv(paste(directory,"/",fileName,".csv",sep=""))[pollutant]
        nValues  <- nValues + sum(!is.na(fileData))
        theSum   <- theSum + colSums(fileData,na.rm = TRUE)
    }
    (theSum / nValues)[[1]]
}