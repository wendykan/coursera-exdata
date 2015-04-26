library(dplyr)
library(ggplot2)
setwd("/Users/wendy/Documents//git//coursera-exdata//proj2")

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

scc_nei = merge(SCC,NEI, by="SCC",all=T)

unique(scc_nei$EI.Sector)
baltimore = scc_nei[which(scc_nei$fips=="24510"),]
vehicle_emission = baltimore[which(grepl("Mobile",baltimore$EI.Sector)),c("year","Emissions")]
plot(summarize(group_by(vehicle_emission,year), Emissions=sum(Emissions)),type="o",
     main = "Emission related to vehicles by year in Baltimore")
