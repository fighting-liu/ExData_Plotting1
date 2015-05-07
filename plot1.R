data <- read.table("household_power_consumption.txt", header = T, sep = ";")
# data$Date <- strptime(data$Date, "%d/%m/%Y")
# data$Date <- as.Date(data$Date)
# t1 <- as.Date("2007-02-01")
# t2 <- as.Date("2007-02-02")
data$Date <- as.character(data$Date)
t1 <- "1/2/2007"
t2 <- "2/2/2007"
use_data <- subset(data, data$Date == t1 | data$Date == t2)

use_data$Global_active_power <- as.numeric(levels(use_data$Global_active_power)
        )[use_data$Global_active_power]
png(file = "plot1.png", width = 480, height = 480)
hist(use_data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)", ylab = "Frequency")

dev.off()