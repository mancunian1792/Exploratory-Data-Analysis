setwd(file.path("C:/Users/user/Documents/Datascience_specialization/Exploratory_Data_Analysis/data/Week 4"))

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have Emissions from coal combustion related sources changed across the US from 99-08.
scc.coal<-SCC[grepl("coal",SCC$Short.Name,ignore.case = TRUE),]

merged_data<-merge(x=NEI,y=scc.coal,by='SCC')
scc.emissions <- aggregate(Emissions ~ year, merged_data, sum)

png("plot4.png",width = 600,height = 600)
barplot(height=scc.emissions$Emissions, names.arg=scc.emissions$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions at various years for coal sources'))
dev.off()