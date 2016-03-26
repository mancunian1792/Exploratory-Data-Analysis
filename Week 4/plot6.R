setwd(file.path("C:/Users/user/Documents/Datascience_specialization/Exploratory_Data_Analysis/data/Week 4"))

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Compare motor vehicle sources of Baltimore and California

#Baltimore
on_road_baltimore<-subset(NEI,fips=="24510" & type=="ON-ROAD")
on_road_baltimore.emissions <- aggregate(Emissions ~ year, on_road_baltimore, sum)

#california
on_road_california<-subset(NEI,fips=="06037" & type=="ON-ROAD")
on_road_california.emissions <- aggregate(Emissions ~ year, on_road_california, sum)
png("plot6.png")

par(mfrow=c(1,2),pty="s")
title("Comparison of Emissions from Motor sources for california and Baltimore")
#plot 1-Baltimore

barplot(height=on_road_baltimore.emissions$Emissions, names.arg=on_road_baltimore.emissions$year,
        xlab="years", ylab=expression('total PM'[2]*' emission-Baltimore'))

#plot2_california
barplot(height=on_road_california.emissions$Emissions, names.arg=on_road_california.emissions$year,
        xlab="years", ylab=expression('total PM'[2]*' emission-California'))

dev.off()