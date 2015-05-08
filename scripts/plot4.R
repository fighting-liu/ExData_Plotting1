setwd("~/Desktop/DataScience/C4-ExploratoryDataAnalysis/week1/ExData_Plotting1")

source("scripts/get_and_clean_data.R")


if(!file.exists("plots")){
    dir.create("plots")
}

png(file = "plots/plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(clean_data$DateAndTime, clean_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

plot(clean_data$DateAndTime, clean_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(clean_data$DateAndTime, clean_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(clean_data$DateAndTime, clean_data$Sub_metering_2, type = "l", col = "red")
lines(clean_data$DateAndTime, clean_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

clean_data <- clean_data[complete.cases(clean_data$Global_reactive_power),]
plot(clean_data$DateAndTime, clean_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()