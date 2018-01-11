library(dplyr)

#Reading the data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subsetting Baltimore City
Baltimore <- filter(NEI, fips=="24510")
#Calculating total PM2.5 emissions
BaltimoreTotalEmissions <- summarise(group_by(Baltimore, year), Total_Emissions = sum(Emissions))

#Plotting
plot(BaltimoreTotalEmissions$year, BaltimoreTotalEmissions$Total_Emissions, "l",main="Total PM2.5 Emissions in Baltimore", xlab="Year", ylab="PM2.5")
model <- lm(Total_Emissions ~ year, BaltimoreTotalEmissions)
abline(model, lwd=2)

#Generating .png
dev.copy(png, file="plot2.png")
dev.off()