# set working directory to data file location
setwd("C:\\Users\\wilkinsonj\\Documents\\ExploratoryDataAnalysis\\Week1//ExData_Plotting1")
# load data
alldata <-read.table("household_power_consumption.txt",header = TRUE,sep=";")
days <- subset(alldata, Date == "2/2/2007" | Date == "1/2/2007")

days$datetime <- paste(days$Date,days$Time)
days$datetime <- strptime(days$datetime, "%d/%m/%Y %H:%M:%S")
with (days,{plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,Sub_metering_2,col="red")
lines(datetime,Sub_metering_3,col="blue")
})

legend("topright",lwd=1,col=c("black","red","blue"),legend = colnames(days)[7:9])

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()

