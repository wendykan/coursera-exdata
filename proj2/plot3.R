library(dplyr)
library(ggplot2)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

baltimore = summarise(group_by(NEI[which(NEI$fips == "24510"),], year, type), Emissions=sum(Emissions))
qplot(year, Emissions, data=baltimore, facets=.~type, geom=c("point","smooth"))+ggtitle("Emissions in Baltimore by emission type")
