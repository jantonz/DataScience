library(dplyr)

#Reading the data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculating the total emissions per year
TotalEmissions <- summarise(group_by(NEI, year), Total_Emissions = sum(Emissions))

#Plotting
plot(TotalEmissions$year, TotalEmissions$Total_Emissions, "l",main="Total PM2.5 Emissions", xlab="Year", ylab="PM2.5")
model <- lm(Total_Emissions ~ year, TotalEmissions)
abline(model, lwd=2)

#Generating .png
dev.copy(png, file="plot1.png")
dev.off()