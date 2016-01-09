#---- Check if myData has already been extracted
if(!exists("myData")){
    print("Extracting the data")
    #---- read and subset the data
    myData <- read.csv(file = "household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
    myData <- myData[myData$Date == "1/2/2007" | myData$Date == "2/2/2007",]
}

#---- Make the plot
png("plot1.png")
hist(myData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()