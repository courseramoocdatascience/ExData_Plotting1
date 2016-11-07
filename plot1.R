#plot 1 

# read the data and subset whats needed
data <-read.csv('household_power_consumption.txt',nrows = 150000, sep=';',header=TRUE, na.strings = "?")
data <- subset( data,( as.Date(data$Date,format='%d/%m/%Y')>=as.Date('2007-02-01',format='%Y-%m-%d') & as.Date(data$Date,format='%d/%m/%Y')<=as.Date('2007-02-02',format='%Y-%m-%d') ) )   

# plot Global Active Power in KW vs Freq
glacpwr <- data$Global_active_power
hist(as.numeric(glacpwr), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# create plot to png file 
png(file = "plot1.png", width=480, height=480)
dev.off()
