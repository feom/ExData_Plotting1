# Creates plot 2.
# 
# Assumption: The input data set is named "household_power_consumption.txt" and resides in the working directory!
#################################################################################################################

#read the input data set for the period 1/2/2007 - 2/2/2007
inputDataSetName <- "household_power_consumption.txt"
inputDataSet <- read.table(inputDataSetName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
periodData <- inputDataSet[inputDataSet$Date %in% c("1/2/2007","2/2/2007"), ]

dateTimeRep <- strptime(paste(periodData$Date, periodData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(periodData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTimeRep, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


