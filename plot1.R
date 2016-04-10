data <- read.csv("Individual household electric power consumption Data Set.txt", sep = ";")

library(dplyr)
data2 <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
head(data2)
head(data2$Global_active_power)
typeof(data2$Global_active_power)
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

png("plot1.png", 480, 480)
hist(data2$Global_active_power, breaks = 20, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
