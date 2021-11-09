# set working directory to data file location
setwd("C:\\Users\\wilkinsonj\\Documents\\ExploratoryDataAnalysis\\Week1//ExData_Plotting1")
# load data
alldata <-read.table("household_power_consumption.txt",header = TRUE,sep=";")
days <- subset(alldata, Date == "2/2/2007" | Date == "1/2/2007")

days$datetime <- paste(days$Date,days$Time)
days$datetime <- strptime(days$datetime, "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
with (days,
      {
        plot(datetime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
        lines(days$datetime,days$Global_active_power)
        plot(datetime,Voltage,type="n")
        lines(days$datetime,days$Voltage)
        plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        lines(days$datetime,days$Sub_metering_1)
        lines(days$datetime,days$Sub_metering_2,col="red")
        lines(days$datetime,days$Sub_metering_3,col="blue")
        legend("topright",lwd=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(datetime,Global_reactive_power,type="n")
        lines(datetime,Global_reactive_power)
})
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
