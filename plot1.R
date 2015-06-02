
setwd("C:/Users/Choo-Yee/Documents/MEGA/Coursera/Learning Materials/Module 4/Assignment 1/plot 1")

library(data.table)
dt<-fread("../data/household_power_consumption.txt", na.strings="?")

dt$strDate <- as.Date(dt$Date,"%d/%m/%Y")
dt.filter<-dt[dt$strDate=="2007-02-01" | dt$strDate=="2007-02-02",]
dt.filter$Global_active_power<-as.numeric(dt.filter$Global_active_power)

png(filename="plot1.png", width=480, height=480)
hist(dt.filter$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()


#data$Date <- as.Date(data$Date, format="%d/%m/%y")
#data$Time <- strptime(data$Time, format="%H:%M:%S")

