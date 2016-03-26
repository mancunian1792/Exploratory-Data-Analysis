setwd(file.path("C:/Users/user/Documents/Datascience_specialization/Exploratory_Data_Analysis/data/Week1"))

# Read data from the file and store it in a dataframe

dataset_week1<-read.csv("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = TRUE)

# See the dataset top and bottom results to make sure data is constructed properly

head(dataset_week1)
tail(dataset_week1)

#Convert the date and time to a format that we can use 
date_time<-paste(dataset_week1$Date,dataset_week1$Time)

dataset_week1$Date<-strptime(date_time,"%d/%m/%Y %T")

# Get our desired working set

working_set<-subset(dataset_week1,Date > "2007-02-01 00:00:00" & Date <"2007-02-02 23:59:59")
working_set$Global_active_power<-as.numeric(as.character(working_set$Global_active_power))
working_set$Global_reactive_power<-as.numeric(as.character(working_set$Global_reactive_power))
working_set$Voltage<-as.numeric(as.character(working_set$Voltage))

working_set$Sub_metering_1<-as.numeric(as.character(working_set$Sub_metering_1))
working_set$Sub_metering_2<-as.numeric(as.character(working_set$Sub_metering_2))
working_set$Sub_metering_3<-as.numeric(as.character(working_set$Sub_metering_3))
# Plot 1
hist(working_set$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power(Kilowatts)")
# Saving to a png file 

dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
