#Filename:
file <- "./data/household_power_consumption.txt"

#Reading and subsetting the data:
dataSet <- read.table(file, 
                      header = TRUE, 
                      sep = ";", 
                      stringsAsFactors = FALSE, 
                      dec = ".")
datesSubset <- dataSet[dataSet$Date %in% c("1/2/2007",
                                           "2/2/2007"),
                       ]

#Adjusting and cleaning the variables set:
times <- strptime(paste(datesSubset$Date, 
                        datesSubset$Time, 
                        sep = " "), 
                  "%d/%m/%Y %H:%M:%S") 
gapData <- as.numeric(datesSubset$Global_active_power)
grpData <- as.numeric(datesSubset$Global_reactive_power)
volData <- as.numeric(datesSubset$Voltage)
sub1 <- as.numeric(datesSubset$Sub_metering_1)
sub2 <- as.numeric(datesSubset$Sub_metering_2)
sub3 <- as.numeric(datesSubset$Sub_metering_3)

#Graphs exporting phase:
png("plot4.png", 
    width = 640, 
    height = 640)
par(mfrow = c(2, 2)) 

plot(times, 
     gapData, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power", 
     cex = 0.2)
plot(times, 
     volData, 
     type = "l", 
     xlab = "times", 
     ylab = "Voltage")
plot(times, 
     sub1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "")

lines(times, 
      sub2, 
      type = "l", 
      col = "red")
lines(times, 
      sub3, 
      type = "l", 
      col = "blue")
legend("topright", 
       c("Sub_metering_1", 
         "Sub_metering_2", 
         "Sub_metering_3"), 
       lty = 1, 
       lwd = 2.5, 
       col = c("black", 
             "red", 
             "blue"), 
       bty = "o")

plot(times, 
     grpData, 
     type = "l", 
     xlab = "times", 
     ylab = "Global_reactive_power")

#End of streaming:
dev.off()
