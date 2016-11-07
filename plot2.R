#plot 2

# read the data and subset whats needed
data <-read.csv('household_power_consumption.txt',nrows = 150000, sep=';',header=TRUE, na.strings = "?")
data <- subset( data,( as.Date(data$Date,format='%d/%m/%Y')>=as.Date('2007-02-01',format='%Y-%m-%d') & as.Date(data$Date,format='%d/%m/%Y')<=as.Date('2007-02-02',format='%Y-%m-%d') ) )   

# plot Global Active Power in KW vs Day
glacpwr <- data$Global_active_power
day <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S") 
plot(day, (as.numeric(glacpwr)), type="l", xlab="", ylab = "Global Active Power(kilowatts)")

# create plot to png file 
png(file = "plot2.png", width=480, height=480)
dev.off()
