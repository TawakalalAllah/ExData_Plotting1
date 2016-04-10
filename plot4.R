data <- read.csv("Individual household electric power consumption Data Set.txt", sep = ";")

library(dplyr)
data2 <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$datetime <- as.POSIXlt(strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S"))

png("plot4.png", 480, 480)
par(mfcol = c(2, 2), mar = c(4, 4, 2, 2))

#plot 1
plot(data2$datetime, data2$Global_active_power, type="l", ylab = "Global Actice Power (kilowatts)", xlab = "")

#plot 2
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))
with(data2, plot(datetime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = ""))
with(data2, points(datetime, Sub_metering_2, col = "Red", type = "l"))
with(data2, points(datetime, Sub_metering_3, col = "Blue", type = "l"))
legend("topright", pch = "_", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"))

#plot 3
head(data2$Voltage)
typeof(data2$Voltage)
data2$Voltage <- as.numeric(as.character(data2$Voltage))
with(data2, plot(datetime, Voltage, type="l"))

#plot 4
head(data2$Global_reactive_power)
typeof(data2$Global_reactive_power)
data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))
with(data2, plot(datetime, Global_reactive_power, type = "l"))

dev.off()

