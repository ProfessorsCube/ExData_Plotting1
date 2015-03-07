
# set working directory to the location 

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

## Plot 2 according to specifications
plot(tidydata$Global_active_power~tidydata$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="") 

## Saving to file (close with dev.off)
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
