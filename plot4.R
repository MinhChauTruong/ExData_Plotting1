# Exploratory Data Analysis: Course Project1: Plot 4
# Author: B.T.Truong

# Reading data from local directory
# Data file should be in directory named "data", which is in the same directory with source code R

data <- read.table(file = "./data/household_power_consumption.txt", na.strings="?", header=TRUE, sep = ";")
data$date_time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Getting subset of data from "2007-02-01 to 2007-02-03"
pdata <- data[which((data$date_time >= "2007-02-01") & (data$date_time < "2007-02-03")),]

#Plotting plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(pdata, plot(date_time, Global_active_power, type = "l", xlab = "", 
	ylab = "Global active power (kilowatts)"))
with(pdata, plot(date_time, Voltage, type = "l", xlab = "", 
	ylab = "Voltage"))
with(pdata, plot(date_time, Sub_metering_1, col = "black", 
                 type = "l", xlab = "", ylab = "Energy sub metering"))
with(pdata, lines (date_time, Sub_metering_2, col = "red", 
                 type = "l", xlab = "", ylab = ""))
with(pdata, lines (date_time, Sub_metering_3, col = "blue", 
                 type = "l", xlab = "", ylab = ""))
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
with(pdata, plot(date_time, Global_reactive_power, type = "l", xlab = "", 
	ylab = "Global_reactive_power"))
dev.off()