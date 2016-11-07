#plot4

# read the data and subset whats needed
data <-read.csv('household_power_consumption.txt',nrows = 150000, sep=';',header=TRUE, na.strings = "?")
data <- subset( data,( as.Date(data$Date,format='%d/%m/%Y')>=as.Date('2007-02-01',format='%Y-%m-%d') & as.Date(data$Date,format='%d/%m/%Y')<=as.Date('2007-02-02',format='%Y-%m-%d') ) )   

#Set the layout for the plots to be displayed in 2 rows and 2 cols
par(mfrow = c(2,2))

#plot Global Active Power in KW vs Day
glacpwr <- data$Global_active_power
day <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S") 
plot(day, (as.numeric(glacpwr)), type="l", xlab="", ylab = "Global Active Power(kilowatts)")

#plot Voltage vs Day
voltage <- data$Voltage
day <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S") 
plot(day, (as.numeric(voltage)), type="l", xlab="datetime", ylab = "Voltage")

# plot Sub_Metering vs Day
subm1<- as.numeric(data$Sub_metering_1)
subm2<- as.numeric(data$Sub_metering_2)
subm3<- as.numeric(data$Sub_metering_3)
day <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S") 
plot(day, subm1, type="l", col="black",  xlab="", ylab = "Energy sub metering")
lines(day, subm2, type="l", col="red")
lines(day, subm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"),cex=0.45)

# plot Global Reactive Power vs Day
glreacpwr <- data$Global_reactive_power
plot(day, (as.numeric(glreacpwr)), type="l", col = "black", xlab = "datetime", ylab = "Global Reactive Power (kilowatts)")

# create plot to png file 
png(file = "plot4.png", width=480, height=480)
dev.off()
