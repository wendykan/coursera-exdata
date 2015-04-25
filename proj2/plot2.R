library(dplyr)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

plot(summarise(group_by(NEI[which(NEI$fips == "24510"),], year), Emissions=sum(Emissions)),
     type="o",
     main = "Emissions in Baltimore by year")
