## change the working directory to what you want(change it as you want to your own path)
setwd("~/Desktop/DataScience/C4-ExploratoryDataAnalysis/week1/ExData_Plotting1")

## load the required packages
library(lubridate)


## check whether the clean data exists,if exists, just read the data,
##    or we need to download the data and make it into clean data
if(!file.exists("clean_data.txt")){
    fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile = "raw_data.zip")
    unzip("raw_data.zip")
    variable.class<-c(rep('character',2),rep('numeric',7))
    raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = variable.class)
    # get the cartain raw data(balance the Date)
    raw_data <- raw_data[raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007", ]
    # combine the Date and Time column into DataAndTime column
    raw_data$DateAndTime <- dmy(raw_data$Date) + hms(raw_data$Time)
    raw_data <- raw_data[, c(10, 3:9)]
    clean_data <- raw_data
    #  this is the final clean data "clean_data.txt"
    write.table(raw_data, file = "clean_data.txt", sep = ";", row.names = FALSE)
}else{
    clean_data <- read.table("clean_data.txt", header = TRUE, sep = ";")
    clean_data$DateAndTime <- as.POSIXlt(clean_data$DateAndTime)
}

## as we have get the clean data, we can delete the large raw data now
if(file.exists("raw_data.zip")){
    file.remove("raw_data.zip")
}
if(file.exists("household_power_consumption.txt")){
    file.remove("household_power_consumption.txt")
}

