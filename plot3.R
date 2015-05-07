data <- read.table("household_power_consumption.txt", header = T, sep = ";")
data$Date <- as.character(data$Date)
t1 <- "1/2/2007"
t2 <- "2/2/2007"
use_data <- subset(data, data$Date == t1 | data$Date == t2)
use_data$Sub_metering_1 <- as.numeric(levels(use_data$Sub_metering_1 )
)[use_data$Sub_metering_1 ]
use_data$Sub_metering_2 <- as.numeric(levels(use_data$Sub_metering_2 )
)[use_data$Sub_metering_2 ]
# use_data$Sub_metering_3 <- as.numeric(levels(use_data$Sub_metering_3 )
# )[use_data$Sub_metering_3 ]

use_data$DateAndTime <- paste(use_data$Date, use_data$Time, sep = " ")
use_data <- use_data[, c(10, 3:9)]
use_data$DateAndTime <- strptime(use_data$DateAndTime, "%d/%m/%Y %H:%M:%S")
png(file = "plot3.png", width = 480, height = 480)
plot(use_data$DateAndTime, use_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(use_data$DateAndTime, use_data$Sub_metering_2, type = "l", col = "red")
lines(use_data$DateAndTime, use_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()