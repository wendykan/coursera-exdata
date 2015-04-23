library(dplyr)

setwd("/Users/wendy/Documents//learn//exdata//proj2")

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

str(NEI)
plot(summarise(group_by(NEI, year), Emissions=sum(Emissions)))
