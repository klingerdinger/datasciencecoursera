library(plyr)
library(dplyr)
library(reshape2)

#____________________
#---- Function to retrieve the raw data
GetData <- function(setLabel){
    #---- Get the subject / activity data
    FileName   <- function(start) paste("UntidyData/",setLabel,"/",start,"_",setLabel,".txt",sep="")
    subjectID  <- read.table(file = FileName("subject"),col.names = c("Participant"))
    activityID <- read.table(file = FileName("y"),col.names = c("Activity"))

    #---- Apply activity labels
    activities <- as.character(read.table("UntidyData/activity_labels.txt",sep = " ")[,2])
    for(i in seq_along(activityID[,1])) activityID[i,1] <- activities[as.integer(activityID[i,1])]
    
    #---- Extract the std and mean data (and replace "..." with "." in the feature names, for readability)
    features   <- as.character(read.table("UntidyData/features.txt",sep = " ")[,2])
    allData    <- read.table(file = FileName("X"),col.names = features)
    stdData    <- allData[grep("-std()",features)]
    meanData   <- allData[grep("-mean()",features)]
    
    #---- Merge the data frames together
    data.frame(subjectID,activityID,meanData,stdData)
}

#____________________
#---- MAIN

#---- Bind together the test and train data
tidyData       <- rbind(GetData("test"),GetData("train"))

#---- Reshape the data, take the mean of each variable and then recast
meltedData     <- melt(tidyData, id.vars=c("Participant", "Activity"),na.rm = TRUE)
meanMeltedData <- ddply(meltedData,c("Participant", "Activity","variable"),summarise,value=mean(value))
meanData       <- dcast(meanMeltedData,Participant + Activity ~ variable)

#---- Write the output to file
write.table(x = meanData, file = "tidyData.txt", sep=" ", row.names = FALSE)