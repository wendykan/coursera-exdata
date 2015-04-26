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

scc_nei = merge(SCC,NEI, by="SCC",all=T)
coal_emission = scc_nei[which(grepl("Coal",scc_nei$EI.Sector)),c("year","Emissions")]
plot(summarize(group_by(coal_emission,year), Emissions=sum(Emissions)),type="o",
     main = "Emission related to coal by year in US")

#5
unique(scc_nei$EI.Sector)
baltimore = scc_nei[which(scc_nei$fips=="24510"),]
vehicle_emission = baltimore[which(grepl("Mobile",baltimore$EI.Sector)),c("year","Emissions")]
plot(summarize(group_by(vehicle_emission,year), Emissions=sum(Emissions)),type="o",
     main = "Emission related to vehicles by year in Baltimore")

#6 
la = scc_nei[which(scc_nei$fips=="06037"),]
vehicle_emission_la = la[which(grepl("Mobile",la$EI.Sector)),c("year","Emissions")]
plot(summarize(group_by(vehicle_emission,year), Emissions=sum(Emissions)),type="o", col="blue"
     main = "Emission related to vehicles by year")
par(new=T)
plot(summarize(group_by(vehicle_emission_la,year), Emissions=sum(Emissions)),col="red",type="o")
