require(data.table)
NEI <- as.data.table(readRDS("summarySCC_PM25.rds"))
EBY<-NEI[,list(Emissions=sum(Emissions)/1000000),by=year]
barplot(EBY$Emissions, main="Total emissions by years",xlab="years",names.arg=EBY$year,yaxt="n",ylab="Emissions (in millions of tons)")
axis(2,at=axTicks(2),labels=paste(axTicks(2),"MM",sep=""), las=1)