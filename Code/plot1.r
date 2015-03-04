# Read data in, assuming the unzipped text file is in the working directory
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Combine date & time into Timestamp with the appropriate format, then convert date to date format
data$Timestamp <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))

# Subset for the data between 2007-02-01 & 2007-02-02
subData <- subset(data, as.Date(data$Date) >=as.Date("2007-02-01") & as.Date(data$Date) <=as.Date("2007-02-02"))

# Plot 1
png(filename = "plot1.png") # Default setting is 480 by 480
hist(subData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()


