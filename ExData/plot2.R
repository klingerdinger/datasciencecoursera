#---- Check if myData has already been extracted
if(!exists("myData")){
    print("Extracting the data")
    #---- read and subset the data
    columnClass = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
    myData <- read.csv(file = "household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?",colClasses = columnClass)
    myData <- myData[myData$Date == "1/2/2007" | myData$Date == "2/2/2007",]
}


#---- Extract the x-axis and y-axis data
x <- strptime(paste(myData$Date,myData$Time),format = "%d/%m/%Y %H:%M:%S")
y <- myData$Global_active_power
#---- Make the plot
png("plot2.png")
plot(x,y,type = "n",main="",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(x,y)
dev.off()