#plot 3

# read the data and subset whats needed
data <-read.csv('household_power_consumption.txt',nrows = 150000, sep=';',header=TRUE, na.strings = "?")
data <- subset( data,( as.Date(data$Date,format='%d/%m/%Y')>=as.Date('2007-02-01',format='%Y-%m-%d') & as.Date(data$Date,format='%d/%m/%Y')<=as.Date('2007-02-02',format='%Y-%m-%d') ) )   

# plot Sub_Metering vs Day
subm1<- as.numeric(data$Sub_metering_1)
subm2<- as.numeric(data$Sub_metering_2)
subm3<- as.numeric(data$Sub_metering_3)
day <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S") 
plot(day, subm1, type="l", col="black",  xlab="", ylab = "Energy sub metering")
lines(day, subm2, type="l", col="red")
lines(day, subm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col=c("black", "red", "blue"), cex=0.75)

# create plot to png file 
png(file = "plot3.png", width=480, height=480)
dev.off()

