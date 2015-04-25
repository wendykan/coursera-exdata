library(dplyr)
library(ggplot2)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
plot(summarise(group_by(NEI, year), Emissions=sum(Emissions)),
     type="o",
     main = "Emissions in the US by year")
