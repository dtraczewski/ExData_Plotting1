#Setting file:
file <- "./data/household_power_consumption.txt"

#Reading the data:
dataSet <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Adjusting variables:
datesSubset <- dataSet[dataSet$Date %in% c("1/2/2007","2/2/2007") ,]
timeSubset <- strptime(paste(datesSubset$Date, 
                           datesSubset$Time, 
                           sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
gapData <- as.numeric(datesSubset$Global_active_power)


#Exporting final graph:
png("plot2.png", 
    width=480, 
    height=480)
plot(timeSubset, 
     gapData, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

#Shutting the stream:
dev.off()
