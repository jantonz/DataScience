library(dplyr)
library(ggplot2)

#Reading the data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subsetting Baltimore City and LA
BALA <- filter(NEI, fips=="24510"|fips == "06037")


#Subsetting motor vehicles by "Onroad" category
Onroad <- filter(SCC, grepl("Onroad", SCC$Data.Category))
OnroadBALA <- BALA[BALA$SCC %in% Onroad$SCC , ]
OnroadBALA$fips<- as.factor(OnroadBALA$fips)
levels(OnroadBALA$fips) <- c("Baltimore", "Los Angeles")
BALAsplit<- split(OnroadBALA, OnroadBALA$fips)

#Plotting
par(mfrow=c(1,2))
plot(BALAsplit[[1]]$year, BALAsplit[[1]]$Emissions, ylab="Emissions", xlab="Year", ylim=c(0,600))
title("Baltimore")
model <- lm(Emissions ~ year, BALAsplit[[1]])
abline(model, lwd=2, col="red")
plot(BALAsplit[[2]]$year, BALAsplit[[2]]$Emissions, ylab="Emissions", xlab="Year")
title("Los Angeles")
model <- lm(Emissions ~ year, BALAsplit[[2]])
abline(model, lwd=2, col="red")

#Generating .png
dev.copy(png, file="plot6.png")
dev.off()