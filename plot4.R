setwd('/Users/Owner/Desktop/CourseraX');

## Read full dataset 
dataX <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 

dataX$Date <- as.Date(dataX$Date, format="%d/%m/%Y")  

## Subsetting the data by period specified
tidydata <- subset(dataX, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(dataX) 

## Converting dates 
datetime <- paste(as.Date(tidydata$Date), tidydata$Time) 
tidydata$Datetime <- as.POSIXct(datetime) 

## Plot 4 creating 4 panels 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(tidydata, { 
     plot(Global_active_power~Datetime, type="l",
          ylab="Global Active Power (kilowatts)", xlab="") 
     
     plot(Voltage~Datetime, type="l",    
          ylab="Voltage (volt)", xlab="") 
     
     plot(Sub_metering_1~Datetime, type="l",  
          ylab="Global Active Power (kilowatts)", xlab="") 
    
     lines(Sub_metering_2~Datetime,col='Red') 
     lines(Sub_metering_3~Datetime,col='Blue') 
     
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
                            legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 ")) 
     plot(Global_reactive_power~Datetime, type="l",  
                       ylab="Global Rective Power (kilowatts)",xlab="") 
}) 

## Saving to file (close with dev.off)
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 