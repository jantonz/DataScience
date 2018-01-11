library(dplyr)

#Reading the data

#Reading data between the end of 2007-01-31 and beginning of 2007-02-03 while assigning column names
column.names.data <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", nrows=1)
column.names <- colnames(column.names.data)
data <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", nrows=4000, skip=66500, col.names=column.names, stringsAsFactors=F)

#Subseting data
data <- filter(data, Date==("1/2/2007") | Date==("2/2/2007"))
data <- mutate(data, DateTime=paste(Date,Time))

#Changing date classes
data$DateTime = strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

#Making plots!
plot(data$DateTime, data$Sub_metering_1, "l", col="black", xlab="", ylab="")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))
title(ylab="Energy sub metering")
dev.copy(png, file="plot3.png")
dev.off()

#Note that the weekday language is Spanish (jue for Thu, vie for Fri and sab for Sat)