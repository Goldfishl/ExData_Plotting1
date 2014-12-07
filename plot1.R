fulldata<-read.csv(file="~/Documents/Data_science/Exploratory_data_analysis/household_power_consumption.txt",
                   sep=';', na.strings="?",stringsAsFactors=FALSE)
fulldata$Date<-as.Date(fulldata$Date, format="%d/%m/%Y")
data<-subset(fulldata,Date=="2007-02-01" | Date=="2007-02-02")
par(mfrow=c(1,1),cex=0.8,mar=c(4,4,4,4))
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png,file="plot1.png",height=480, width=480)
dev.off()
