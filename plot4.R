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
use_data$Global_reactive_power <- as.numeric(levels(use_data$Global_reactive_power)
)[use_data$Global_reactive_power]

use_data$Sub_metering_1 <- as.numeric(levels(use_data$Sub_metering_1 )
)[use_data$Sub_metering_1 ]
use_data$Sub_metering_2 <- as.numeric(levels(use_data$Sub_metering_2 )
)[use_data$Sub_metering_2 ]

use_data$DateAndTime <- paste(use_data$Date, use_data$Time, sep = " ")
use_data <- use_data[, c(10, 3:9)]
use_data$DateAndTime <- strptime(use_data$DateAndTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(use_data$DateAndTime, use_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

plot(use_data$DateAndTime, use_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(use_data$DateAndTime, use_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(use_data$DateAndTime, use_data$Sub_metering_2, type = "l", col = "red")
lines(use_data$DateAndTime, use_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

use_data <- use_data[complete.cases(use_data$Global_reactive_power),]
plot(use_data$DateAndTime, use_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
