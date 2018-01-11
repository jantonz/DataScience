library(dplyr)

#Reading the data

#Reading data between the end of 2007-01-31 and beginning of 2007-02-03 while assigning column names
column.names.data <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", nrows=1)
column.names <- colnames(column.names.data)
data <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", nrows=4000, skip=66500, col.names=column.names, stringsAsFactors=F)

#Subseting data
data <- filter(data, Date==("1/2/2007") | Date==("2/2/2007"))

#Changing date classes
data$Date = strptime(data$Date, format="%d/%m/%Y")


#Making plots!
hist(data$Global_active_power, col=2, main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()