corr <- function(directory, threshold = 0) {    
    vector <- c(numeric())
    filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
    for(fileName in filenames){
        fileData <- read.csv(fileName)

        completeCases <- complete.cases(fileData)
        nComplete <- sum(completeCases)
        if(nComplete < threshold) next
        if(nComplete == 0) next
        fileData <- fileData[completeCases,]
        x <- as.vector(fileData['sulfate'])
        y <- as.vector(fileData['nitrate'])
        vector <- c(vector, cor(x,y)[[1]])
    }
    vector
}