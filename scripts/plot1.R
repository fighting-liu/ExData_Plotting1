setwd("~/Desktop/DataScience/C4-ExploratoryDataAnalysis/week1/ExData_Plotting1")

source("scripts/get_and_clean_data.R")


if(!file.exists("plots")){
    dir.create("plots")
}

png(file = "plots/plot1.png", width = 480, height = 480)
hist(clean_data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()