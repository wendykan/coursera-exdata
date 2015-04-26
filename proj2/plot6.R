library(dplyr)
library(ggplot2)
setwd("/Users/wendy/Documents//git//coursera-exdata//proj2")

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

scc_nei = merge(SCC,NEI, by="SCC",all=T)

la = scc_nei[which(scc_nei$fips=="06037"),]
vehicle_emission_la = la[which(grepl("Mobile",la$EI.Sector)),c("year","Emissions")]
plot(summarize(group_by(vehicle_emission,year), Emissions=sum(Emissions)),type="o", col="blue"
     main = "Emission related to vehicles by year")
par(new=T)
plot(summarize(group_by(vehicle_emission_la,year), Emissions=sum(Emissions)),col="red",type="o")
