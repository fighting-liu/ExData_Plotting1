## change the working directory to what you need
setwd("~/Desktop/DataScience/C4-ExploratoryDataAnalysis/week1/ExData_Plotting1")

## load the required packages
library(lubridate)

## check whether the "sourceData" directory exists
if(!file.exists("sourceData")){
    dir.create("sourceData")
}

if(!file.exists("sourceData/clean_data.txt")){
    fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile = "sourceData/raw_data.zip")
    unzip("sourceData/raw_data.zip", exdir = "sourceData")
    raw_data <- read.table("sourceData/household_power_consumption.txt", header = TRUE, sep = ";")
    raw_data <- raw_data[raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007", ]
    raw_data$DateAndTime <- dmy(raw_data$Date) + hms(raw_data$Time)
    raw_data <- raw_data[, c(10, 3:9)]
    
    write.table(raw_data, file = "sourceData/clean_data.txt", sep = ";", row.names = FALSE)
}else{
    clean_data <- read.table("sourceData/clean_data.txt", header = TRUE, sep = ";")
    clean_data$DateAndTime <- as.POSIXlt(clean_data$DateAndTime)
#     clean_data$Global_active_power <- as.numeric(levels(clean_data$Global_active_power)
#     )[clean_data$Global_active_power]
#     clean_data$Sub_metering_1 <- as.numeric(levels(clean_data$Sub_metering_1 )
#     )[clean_data$Sub_metering_1 ]
#     clean_data$Sub_metering_2 <- as.numeric(levels(clean_data$Sub_metering_2 )
#     )[clean_data$Sub_metering_2 ]
}

if(file.exists("sourceData/raw_data.zip")){
    file.remove("sourceData/raw_data.zip")
}
if(file.exists("sourceData/household_power_consumption.txt")){
    file.remove("sourceData/household_power_consumption.txt")
}

