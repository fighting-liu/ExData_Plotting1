## change the working directory to what you want(change it as you want to your own path)
setwd("~/Desktop/DataScience/C4-ExploratoryDataAnalysis/week1/ExData_Plotting1")

## load the source of the clean data, and preprocess the data if needed
source("get_and_clean_data.R")

## code that creates the PNG file
png(file = "plot3.png", width = 480, height = 480)
# draw the plot
plot(clean_data$DateAndTime, clean_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(clean_data$DateAndTime, clean_data$Sub_metering_2, type = "l", col = "red")
lines(clean_data$DateAndTime, clean_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()