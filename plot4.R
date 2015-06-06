# Creates plot 4.
# 
# Assumption: The input data set is named "household_power_consumption.txt" and resides in the working directory!
#################################################################################################################

#read the input data set for the period 1/2/2007 - 2/2/2007
inputDataSetName <- "household_power_consumption.txt"
inputDataSet <- read.table(inputDataSetName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
periodData <- inputDataSet[inputDataSet$Date %in% c("1/2/2007","2/2/2007"), ]

dateTimeRep <- strptime(paste(periodData$Date, periodData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(periodData$Global_active_power)
globalReactivePower <- as.numeric(periodData$Global_reactive_power)
voltage <- as.numeric(periodData$Voltage)
subMeteringOne <- as.numeric(periodData$Sub_metering_1)
subMeteringTwo <- as.numeric(periodData$Sub_metering_2)
subMeteringThree <- as.numeric(periodData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dateTimeRep, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dateTimeRep, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateTimeRep, subMeteringOne, type="l", ylab="Energy sub metering", xlab="")
lines(dateTimeRep, subMeteringTwo, type="l", col="red")
lines(dateTimeRep, subMeteringThree, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateTimeRep, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()


