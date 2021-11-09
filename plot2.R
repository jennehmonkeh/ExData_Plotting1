# set working directory to data file location
setwd("C:\\Users\\wilkinsonj\\Documents\\ExploratoryDataAnalysis\\Week1//ExData_Plotting1")
# load data
alldata <-read.table("household_power_consumption.txt",header = TRUE,sep=";")
days <- subset(alldata, Date == "2/2/2007" | Date == "1/2/2007", select = c("Date","Time","Global_active_power"))

days$datetime <- paste(days$Date,days$Time)
days$datetime <- strptime(days$datetime, "%d/%m/%Y %H:%M:%S")
with (days,plot(datetime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
lines(days$datetime,days$Global_active_power)

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
