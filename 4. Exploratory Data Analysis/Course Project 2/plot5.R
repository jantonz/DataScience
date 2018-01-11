library(dplyr)
library(ggplot2)

#Reading the data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subsetting Baltimore City
Baltimore <- filter(NEI, fips=="24510")
#Subsetting motor vehicles by "Onroad" category
Onroad <- filter(SCC, grepl("Onroad", SCC$Data.Category))
OnroadNEI <- Baltimore[Baltimore$SCC %in% Onroad$SCC , ]
SummaryOnroadNEI <- summarise(group_by(OnroadNEI, year), Total=sum(Emissions))

#Plotting
g <- qplot(year, Total, data=SummaryOnroadNEI)
g + geom_smooth(method="lm")+xlab("Year")+ylab("Total Emissions")+ggtitle("Total Motor-Related Emissions in Baltimore")

#Generating .png
dev.copy(png, file="plot5.png")
dev.off()