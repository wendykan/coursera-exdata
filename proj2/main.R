library(dplyr)
library(ggplot2)
setwd("/Users/wendy/Documents//git//coursera-exdata//proj2")

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

str(NEI)
plot(summarise(group_by(NEI, year), Emissions=sum(Emissions)),
     type="o",
     main = "Emissions in the US by year")
plot(summarise(group_by(NEI[which(NEI$fips == "24510"),], year), Emissions=sum(Emissions)),
     type="o",
     main = "Emissions in Baltimore by year")

baltimore = summarise(group_by(NEI[which(NEI$fips == "24510"),], year, type), Emissions=sum(Emissions))
qplot(year, Emissions, data=baltimore, facets=.~type, geom=c("point","smooth"))+ggtitle("Emissions in Baltimore by emission type")
