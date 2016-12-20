
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSet$Global_active_power)
subMetering1 <- as.numeric(subSet$Sub_metering_1)
subMetering2 <- as.numeric(subSet$Sub_metering_2)
subMetering3 <- as.numeric(subSet$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Sub Metering", xlab="")
lines(datetime, subMetering2, type="l", col="Red")
lines(datetime, subMetering3, type="l", col="Blue")
legend("topright", lty=1, lwd=4, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()