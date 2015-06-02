
setwd("C:/Users/Choo-Yee/Documents/MEGA/Coursera/Learning Materials/Module 4/Assignment 1/plot 4")

library(data.table)
library(lubridate)
dt<-fread("../data/household_power_consumption.txt", na.strings="?")
dt$Date <- as.Date(dt$Date,format="%d/%m/%Y")
dt.filter<-dt[dt$Date=="2007-02-01" | dt$Date=="2007-02-02",]
dt.filter$Global_active_power<-as.numeric(dt.filter$Global_active_power)

dt.filter$DateTime <- as.POSIXct(paste(dt.filter$Date, dt.filter$Time, sep=" "), 
                                 format="%Y-%m-%d %H:%M:%S")

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(dt.filter$DateTime, dt.filter$Global_active_power, typ='l', xlab="", ylab="Global Active Power")

plot(dt.filter$DateTime, dt.filter$Voltage, typ='l', xlab="datetime", ylab="Voltage")

plot(dt.filter$DateTime, 
     dt.filter$Sub_metering_1, 
     col="black",
     typ='l', 
     xlab="", 
     ylab="Energy sub metering")

lines(dt.filter$DateTime,dt.filter$Sub_metering_2, col="red",lwd=2.5)

lines(dt.filter$DateTime,dt.filter$Sub_metering_3, col="blue",lwd=2.5)

legend("topright",  
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),       
       lwd=c(2,2,2),
       cex=.75,
       col=c("black","red","blue")) 

plot(dt.filter$DateTime, dt.filter$Global_reactive_power, typ='l', xlab="datetime", ylab="Global_reactive_power")

dev.off()


#data$Date <- as.Date(data$Date, format="%d/%m/%y")
#data$Time <- strptime(data$Time, format="%H:%M:%S")
