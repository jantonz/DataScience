library(dplyr)
library(ggplot2)

#Reading the data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subsetting Baltimore City
Baltimore <- filter(NEI, fips=="24510")

#Plotting
g <- qplot(year, Emissions, data=Baltimore, facets=.~type)
g + geom_smooth(method="lm")+coord_cartesian(ylim=c(0,75))

#Generating .png
dev.copy(png, file="plot3.png")
dev.off()