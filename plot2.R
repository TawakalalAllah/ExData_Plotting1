data <- read.csv("Individual household electric power consumption Data Set.txt", sep = ";")

library(dplyr)
data2 <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$DateTime <- as.POSIXlt(strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S"))

png("plot2.png", 480, 480)
plot(data2$DateTime, data2$Global_active_power, type="l", ylab = "Global Actice Power (kilowatts)", xlab = "")
dev.off()
