

setwd(file.path("C:/Users/user/Documents/Datascience_specialization/Exploratory_Data_Analysis/data/Week 4"))

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore from 1999 to
# 2008?

totalBalt.emissions<-subset(NEI,fips=="24510")
total.emissions <- aggregate(Emissions ~ year, totalBalt.emissions, sum)

png('plot2.png',width = 800,height = 600)
barplot(height=total.emissions$Emissions, names.arg=total.emissions$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions at various years'))
dev.off()