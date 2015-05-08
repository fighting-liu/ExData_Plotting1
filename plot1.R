## change the working directory to what you want(change it as you want to your own path)
setwd("~/Desktop/DataScience/C4-ExploratoryDataAnalysis/week1/ExData_Plotting1")

## load the source of the clean data, and preprocess the data if needed
source("get_and_clean_data.R")


## code that creates the PNG file
png(file = "plot1.png", width = 480, height = 480)
hist(clean_data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()