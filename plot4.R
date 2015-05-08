## change the working directory to what you want(change it as you want to your own path)
setwd("~/Desktop/DataScience/C4-ExploratoryDataAnalysis/week1/ExData_Plotting1")

## load the source of the clean data, and preprocess the data if needed
source("get_and_clean_data.R")

## code that creates the PNG file
png(file = "plot4.png", width = 480, height = 480)
# draw the plot separaterly
par(mfrow = c(2, 2))
# the first plot 
plot(clean_data$DateAndTime, clean_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
# the second plot
plot(clean_data$DateAndTime, clean_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# the third plot 
plot(clean_data$DateAndTime, clean_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(clean_data$DateAndTime, clean_data$Sub_metering_2, type = "l", col = "red")
lines(clean_data$DateAndTime, clean_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# the fourth plot
clean_data <- clean_data[complete.cases(clean_data$Global_reactive_power),]
plot(clean_data$DateAndTime, clean_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()