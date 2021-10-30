#Data Science Specialization - Course 4 Exploratory Data Analysis
#Course Project - Week 1
#Plot 3

library(lubridate)

#Reads and subsets Data if not available already
if(!exists("DataTF")){ 
        #Reads Data
        Data <- read.csv("household_power_consumption.txt",sep = ";")

        #Converts Time column to Date/Time format
        Data$Time <- strptime(paste(Data$Date,Data$Time),"%d/%m/%Y %H:%M:%S")

        #Converts to Date Format
        Data$Date <- as.Date(strptime(Data$Date,"%d/%m/%Y"))

        #Subsetting the required TimeFrame
        DataTF <- subset(Data,Date >= "2007-02-01" & Date <= "2007-02-02")
}
        
#Plot the Scatterplot 3
png("plot3.png")
with(DataTF,plot(Time,Sub_metering_1,type = "n",xlab=" ",ylab="Energy sub metering"))
with(DataTF,lines(Time,Sub_metering_1))
with(DataTF,lines(Time,Sub_metering_2,col = "red"))
with(DataTF,lines(Time,Sub_metering_3,col = "blue"))
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1)
dev.off()
