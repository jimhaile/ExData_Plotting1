#plot2.R

setwd("/Users/jim/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$dateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
#convert Date to date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date=="2007-02-01"| Date=="2007-02-02")

png(filename="plot2.png", width=480, height=480, 'bg'='gray') #I made Gray because the example is gray
plot(data$dateTime, data$Global_active_power, type='n', xlab="",ylab="Global Active Power (kilowatts)")
lines(data$dateTime, data$Global_active_power)
dev.off()
