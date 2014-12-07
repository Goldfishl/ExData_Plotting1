fulldata<-read.csv(file="~/Documents/Data_science/Exploratory_data_analysis/household_power_consumption.txt",
                   sep=';', na.strings="?",stringsAsFactors=FALSE)
fulldata$Date<-as.Date(fulldata$Date, format="%d/%m/%Y")
data<-subset(fulldata,Date=="2007-02-01" | Date=="2007-02-02")
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)
par(mfrow=c(2,2), mar=c(4,4,4,2),cex=0.6)
with(data,{plot(data$Global_active_power~data$datetime,type="l",xlab="",
                ylab="Global Active Power")
           plot(data$Voltage~data$datetime,type="l",xlab="datetime",ylab="Voltage")
           plot(data$Sub_metering_1~data$datetime,type="l",xlab="",ylab="Energy sub metering",col="black")
           lines(data$Sub_metering_2~data$datetime,col="red")
           lines(data$Sub_metering_3~data$datetime,col="blue")
           legend("topright", col = c("black","blue", "red"),lty=1,lwd=1,bty="n",y.intersp=0.7,
                       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
           plot(data$Global_reactive_power~data$datetime,type="l",xlab="datetime",
                ylab="Global_reactive_power")
})
dev.copy(png,file="plot4.png",height=480, width=480)
dev.off()

