#---- Check if myData has already been extracted
if(!exists("myData")){
    print("Extracting the data")
    #---- read and subset the data
    columnClass = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
    myData <- read.csv(file = "household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?",colClasses = columnClass)
    myData <- myData[myData$Date == "1/2/2007" | myData$Date == "2/2/2007",]
}


#---- Extract the x and y-axis data
x <- strptime(paste(myData$Date,myData$Time),format = "%d/%m/%Y %H:%M:%S")
y1 <- myData$Sub_metering_1
y2 <- myData$Sub_metering_2
y3 <- myData$Sub_metering_3

#---- Make the plot
png("plot3.png")
plot(x,y1,type = "n",main="",xlab = "",ylab = "Global sub metering")
lines(x,y1,col="black")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1,1,1))
dev.off()