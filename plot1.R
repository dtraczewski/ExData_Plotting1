#Name of the file with dataset:
file <- "./data/household_power_consumption.txt"

#Reading dataset from assigned file:
dataSet <- read.table(file, 
                   header=TRUE, 
                   sep=";", 
                   stringsAsFactors=FALSE, 
                   dec="."
                   )

#Dataset dates adjustment and numeric variables correction:
subsetDates <- dataSet[dataSet$Date %in% c("1/2/2007","2/2/2007") ,]
gapSubset <- as.numeric(subsetDates$Global_active_power)

#Exporting graph:
png("plot1.png", 
    width=480, 
    height=480)
hist(gapSubset, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

#Switch off the stream:
dev.off()
