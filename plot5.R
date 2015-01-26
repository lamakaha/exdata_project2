require(data.table)
require(ggplot2)
require(MASS)
require(splines)
SCC_VEH <- as.data.table(readRDS("Source_Classification_Code.rds"))[Short.Name %like% "Veh",list(SCC=as.character(SCC))]
setkey(SCC_VEH,SCC)
NEI <- as.data.table(readRDS("summarySCC_PM25.rds"))
setkey(NEI,SCC)
NEI_BALT_SCC_VEH<-merge(NEI[fips == "24510"],SCC_VEH)
VEBY<-NEI_BALT_SCC_VEH[,list(Emissions=sum(Emissions)),by=year]
png(file = "plot5.png")
print(qplot(year,Emissions, geom = c("point","smooth"), method = "rlm", data = VEBY,main="Baltimore City motor vehicle emissions",ylab="Emissions (in tons)",xlab="years"))
dev.off()