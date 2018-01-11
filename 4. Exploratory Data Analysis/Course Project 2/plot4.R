library(dplyr)
library(ggplot2)

#Reading the data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subsetting 
CoalSCC <- filter(SCC, grepl("Coal", SCC$EI.Sector))
CoalNEI <- NEI[NEI$SCC %in% CoalSCC$SCC , ]
SummaryCoalNEI <- summarise(group_by(CoalNEI, year), Total=sum(Emissions))


#Plotting
g <- qplot(year, Total, data=SummaryCoalNEI)
g + geom_smooth(method="lm")+xlab("Year")+ylab("Total Coal-Related Emissions")

#Generating .png
dev.copy(png, file="plot4.png")
dev.off()