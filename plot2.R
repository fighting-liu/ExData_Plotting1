data <- read.table("household_power_consumption.txt", header = T, sep = ";")
# data$Date <- strptime(data$Date, "%d/%m/%Y")
# data$Date <- as.Date(data$Date)
data$Date <- as.character(data$Date)
t1 <- "1/2/2007"
t2 <- "2/2/2007"
use_data <- subset(data, data$Date == t1 | data$Date == t2)
use_data$Global_active_power <- as.numeric(levels(use_data$Global_active_power)
    )[use_data$Global_active_power]

use_data$DateAndTime <- paste(use_data$Date, use_data$Time, sep = " ")
use_data <- use_data[, c(10, 3:9)]
use_data$DateAndTime <- strptime(use_data$DateAndTime, "%d/%m/%Y %H:%M:%S")
png(file = "plot2.png", width = 480, height = 480)
plot(use_data$DateAndTime, use_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()



