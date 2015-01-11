# Read data, change Date format and subset data
power_Consump <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
power_Consump$Date <- as.Date(power_Consump$Date, format = "%d/%m/%Y")
sub.data <- subset(power_Consump, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Tie Date and Time together
datetime <- paste(as.Date(sub.data$Date), sub.data$Time)
sub.data$Datetime <- as.POSIXct(datetime)

# Generating plot 3
with(sub.data, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  })

# Add legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, 
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

