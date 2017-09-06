#Datafile name:
file <- "./data/household_power_consumption.txt"

#Reading the dataset:
dataSet <- read.table(file, 
                   header=TRUE, 
                   sep=";", 
                   stringsAsFactors=FALSE, 
                   dec=".")

#Narrowing down the time period:
dateSubset <- dataSet[dataSet$Date %in% c("1/2/2007","2/2/2007") ,]

#Formatting dates:
timeSubset <- strptime(paste(dateSubset$Date, 
                             dateSubset$Time, 
                             sep=" "), 
                       "%d/%m/%Y %H:%M:%S")

#Creating particular subsets
gapData <- as.numeric(dateSubset$Global_active_power)
subset1 <- as.numeric(dateSubset$Sub_metering_1)
subset2 <- as.numeric(dateSubset$Sub_metering_2)
subset3 <- as.numeric(dateSubset$Sub_metering_3)

#Graphs creating and exporting:
png("plot3.png", 
    width = 640, 
    height = 480)
plot(timeSubset, 
     subset1, 
     type="l", 
     ylab="Energy sub metering", 
     xlab="")
lines(timeSubset, 
      subset2, 
      type="l", 
      col="red")
lines(timeSubset, 
      subset3, 
      type="l", 
      col="blue")
legend("topright", 
       c("Sub_metering_1", 
         "Sub_metering_2", 
         "Sub_metering_3"), 
       lty=1, 
       lwd=2.5, 
       col=c("black", 
             "red", 
             "blue"
             )
       )

#Shutting off the stream:
dev.off()
