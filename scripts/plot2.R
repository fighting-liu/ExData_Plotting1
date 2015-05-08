setwd("~/Desktop/DataScience/C4-ExploratoryDataAnalysis/week1/ExData_Plotting1")

source("scripts/get_and_clean_data.R")


if(!file.exists("plots")){
    dir.create("plots")
}

png(file = "plots/plot2.png", width = 480, height = 480)
plot(clean_data$DateAndTime, clean_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()