# Assignment for week 1 of Exploratory Data Analysis
library(dplyr)
# set working directory to data file location
setwd("C:\\Users\\wilkinsonj\\Documents\\ExploratoryDataAnalysis\\Week1//ExData_Plotting1")
# load data
alldata <-read.table("household_power_consumption.txt",header = TRUE,sep=";")
feb2days <- alldata %>% filter(Date == "2/2/2007" | Date == "1/2/2007")
feb2days$Global_active_power <- as.numeric(feb2days$Global_active_power)
hist(feb2days$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
