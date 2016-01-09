complete <- function(directory, idVector = 1:332) {
    
    df <- data.frame(id = integer(), nobs = integer())
    for(i in 1:length(idVector)){
        id = idVector[i]
        fileName = toString(id)
        if(id < 10)  fileName <- paste("0",fileName,sep="")
        if(id < 100) fileName <- paste("0",fileName,sep="")
        fileData <- read.csv(paste(directory,"/",fileName,".csv",sep=""))
        df[i,] <- list(idVector[i],sum(complete.cases(fileData)))
    }
    df
}

