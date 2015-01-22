require(data.table)
require(ggplot2)
require(MASS)
require(splines)
NEI <- as.data.table(readRDS("summarySCC_PM25.rds"))
EBTY<-NEI[fips == "24510",list(Emissions=sum(Emissions)),by=list(type,year)]
png(file = "plot3.png")
print(qplot(year,Emissions, geom = c("point","smooth"), method = "rlm", data = EBTY, facets = type ~ .,main="Baltimore City emissions by source type",ylab="Emissions (in tons)",xlab="years"))
dev.off()