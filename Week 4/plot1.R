
setwd(file.path("C:/Users/user/Documents/Datascience_specialization/Exploratory_Data_Analysis/data/Week 4"))
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008?


total.emissions <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=total.emissions$Emissions, names.arg=total.emissions$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions at various years'))
dev.off()