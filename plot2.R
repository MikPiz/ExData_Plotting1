# Read data, change Date format and subset data
power_Consump <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
power_Consump$Date <- as.Date(power_Consump$Date, format = "%d/%m/%Y")
sub.data <- subset(power_Consump, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Tie Date and Time together
datetime <- paste(as.Date(sub.data$Date), sub.data$Time)
sub.data$Datetime <- as.POSIXct(datetime)

# Generating plot 2
plot(sub.data$Global_active_power ~ sub.data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
