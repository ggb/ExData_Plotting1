# Read data 
exdata <- read.csv(unzip("exdata_data_household_power_consumption.zip"), sep = ";", na.strings = "?")

# Add column for date and time as R objects
exdata$DateTime <- strptime(paste(exdata$Date, exdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Subset the data
vizData <- subset(exdata, exdata$Date == "1/2/2007" | exdata$Date == "2/2/2007")

# Create plot
png(filename="plot3.png", width = 480, height = 480, units = "px")
plot(vizData$DateTime, vizData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(vizData$DateTime, vizData$Sub_metering_2, col = "red")
lines(vizData$DateTime, vizData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2.5)
dev.off()