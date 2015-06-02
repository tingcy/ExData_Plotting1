
setwd("C:/Users/Choo-Yee/Documents/MEGA/Coursera/Learning Materials/Module 4/Assignment 1/plot 2")

library(data.table)
library(lubridate)
dt<-fread("../data/household_power_consumption.txt", na.strings="?")
dt$Date <- as.Date(dt$Date,format="%d/%m/%Y")
dt.filter<-dt[dt$Date=="2007-02-01" | dt$Date=="2007-02-02",]
dt.filter$Global_active_power<-as.numeric(dt.filter$Global_active_power)

dt.filter$DateTime <- as.POSIXct(paste(dt.filter$Date, dt.filter$Time, sep=" "), 
                            format="%Y-%m-%d %H:%M:%S")

png(filename="plot2.png", width=480, height=480)

plot(dt.filter$DateTime, dt.filter$Global_active_power, typ='l', xlab="", ylab="Global Active Power (kilowatts)")

dev.off()


#data$Date <- as.Date(data$Date, format="%d/%m/%y")
#data$Time <- strptime(data$Time, format="%H:%M:%S")

