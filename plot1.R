# Read data 
exdata <- read.csv(unzip("exdata_data_household_power_consumption.zip"), sep = ";", na.strings = "?")

# Add column for date and time as R objects
exdata$DateTime <- strptime(paste(exdata$Date, exdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Subset the data
vizData <- subset(exdata, exdata$Date == "1/2/2007" | exdata$Date == "2/2/2007")

# Create plot
png(filename="plot1.png", width = 480, height = 480, units = "px")
hist(vizData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()