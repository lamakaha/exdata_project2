require(data.table)
NEI <- as.data.table(readRDS("summarySCC_PM25.rds"))
EBY<-NEI[fips == "24510",list(Emissions=sum(Emissions)/1000),by=year]
png(file = "plot2.png")
plot(EBY$Emissions~EBY$year, type="p", col="blue", pch=2, main="Baltimore City, Maryland emissions by years",yaxt="n",xlab="years",ylab="Emissions (in thousands of tons)")
abline(lm(EBY$Emissions~EBY$year),col="red", lwd = 4)
axis(2,at=axTicks(2),labels=paste(axTicks(2),"K",sep=""), las=1)
dev.off()