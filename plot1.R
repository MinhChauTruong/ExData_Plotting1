# Exploratory Data Analysis: Course Project1: Plot 1
# Author: B.T.Truong

# Reading data from local directory
# Data file should be in directory named "data", which is in the same directory with source code R

data <- read.table(file = "./data/household_power_consumption.txt", na.strings="?", header=TRUE, sep = ";")
data$date_time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Getting subset of data from "2007-02-01 to 2007-02-03"
pdata <- data[which((data$date_time >= "2007-02-01") & (data$date_time < "2007-02-03")),]

#Plotting plot1
png("plot1.png", width=480, height=480)
hist(pdata$Global_active_power, xlab = "Global active power (kilowatts)", ylab = "Frequency", 
	col = "red", main = "Global Active Power")
dev.off()
