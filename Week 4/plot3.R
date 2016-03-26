setwd(file.path("C:/Users/user/Documents/Datascience_specialization/Exploratory_Data_Analysis/data/Week 4"))

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


totalBalt.emissions<-subset(NEI,fips=="24510")
png('plot3.png',width = 800,height = 600)

ggplot(totalBalt.emissions,aes(factor(year),Emissions))+facet_grid(.~type)+geom_bar(stat="identity")+ylab(expression('total PM'[2]*' emission'))+xlab('Year')+ggtitle('Emissions from all sources in baltimore across years')
dev.off()