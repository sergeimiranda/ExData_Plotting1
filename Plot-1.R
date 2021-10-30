#Data Science Specialization - Course 4 Exploratory Data Analysis
#Course Project - Week 1
#Plot 1

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
        
#Plot the Histogram:
png("plot1.png")
hist(as.numeric(DataTF$Global_active_power),xlab = "Global Active Power (kilowatts)",main = "Global Active Power", col="red")
dev.off()
