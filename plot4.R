# set working directory to data file location
setwd("C:\\Users\\wilkinsonj\\Documents\\ExploratoryDataAnalysis\\Week1//ExData_Plotting1")
# load data
alldata <-read.table("household_power_consumption.txt",header = TRUE,sep=";")
#use only the dates required
days <- subset(alldata, Date == "2/2/2007" | Date == "1/2/2007")
# make a date time column for the time series
days$datetime <- paste(days$Date,days$Time)
days$datetime <- strptime(days$datetime, "%d/%m/%Y %H:%M:%S")
# open graphic device, png file
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with (days,
      {
        #plot #1
        plot(datetime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
        lines(datetime,Global_active_power)
        #plot #2
        plot(datetime,Voltage,type="n")
        lines(datetime,Voltage)
        #plot #3
        plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        lines(datetime,Sub_metering_2,col="red")
        lines(datetime,Sub_metering_3,col="blue")
        legend("topright",lwd=1,col=c("black","red","blue"),legend = colnames(days)[7:9])
        #plot #4
        plot(datetime,Global_reactive_power,type="n")
        lines(datetime,Global_reactive_power)
      })
#close the graphics device
dev.off()
