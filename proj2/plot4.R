library(dplyr)
library(ggplot2)
setwd("/Users/wendy/Documents//git//coursera-exdata//proj2")

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

scc_nei = merge(SCC,NEI, by="SCC",all=T)
coal_emission = scc_nei[which(grepl("Coal",scc_nei$EI.Sector)),c("year","Emissions")]
plot(summarize(group_by(coal_emission,year), Emissions=sum(Emissions)),type="o",
     main = "Emission related to coal by year in US")
