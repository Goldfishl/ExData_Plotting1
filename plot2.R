fulldata<-read.csv(file="~/Documents/Data_science/Exploratory_data_analysis/household_power_consumption.txt",
                   sep=';', na.strings="?",stringsAsFactors=FALSE)
fulldata$Date<-as.Date(fulldata$Date, format="%d/%m/%Y")
data<-subset(fulldata,Date=="2007-02-01" | Date=="2007-02-02")
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)
plot(data$Global_active_power~data$datetime,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",height=480, width=480)
dev.off()

