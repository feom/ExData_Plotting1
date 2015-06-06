# Creates plot 3.
# 
# Assumption: The input data set is named "household_power_consumption.txt" and resides in the working directory!
#################################################################################################################

#read the input data set for the period 1/2/2007 - 2/2/2007
inputDataSetName <- "household_power_consumption.txt"
inputDataSet <- read.table(inputDataSetName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
periodData <- inputDataSet[inputDataSet$Date %in% c("1/2/2007","2/2/2007"), ]

dateTimeRep <- strptime(paste(periodData$Date, periodData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(periodData$Global_active_power)
subMeteringOne <- as.numeric(periodData$Sub_metering_1)
subMeteringTwo <- as.numeric(periodData$Sub_metering_2)
subMeteringThree <- as.numeric(periodData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dateTimeRep, subMeteringOne, type="l", ylab="Energy sub metering", xlab="")
lines(dateTimeRep, subMeteringTwo, type="l", col="red")
lines(dateTimeRep, subMeteringThree, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()



