setwd(file.path("C:/Users/user/Documents/Datascience_specialization/Exploratory_Data_Analysis/data/Week 4"))

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have emissions related to motor related sources decreased in baltimore?
on_road<-subset(NEI,fips=="24510" & type=="ON-ROAD")
on_road.emissions <- aggregate(Emissions ~ year, on_road, sum)
png("plot5.png" )
barplot(height=on_road.emissions$Emissions, names.arg=on_road.emissions$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions at various years for motor sources'))
dev.off()