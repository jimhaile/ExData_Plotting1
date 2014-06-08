#plot4.R

setwd("/Users/jim/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$dateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
#convert Date to date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date=="2007-02-01"| Date=="2007-02-02")



png(filename="plot4.png", width=480, height=480, 'bg'='gray') #I made Gray because the example is gray
#add graphs by columns
par(mfcol=c(2,2))
#first graph
plot(data$dateTime, data$Global_active_power, type='n', xlab="",ylab="Global Active Power (kilowatts)")
lines(data$dateTime, data$Global_active_power)

# 2nd graph
plot(data$dateTime, data$Sub_metering_1, type='n', xlab="",ylab="Energy sub metering ")
lines(data$dateTime, data$Sub_metering_1, col="black")
lines(data$dateTime, data$Sub_metering_2, col="red")
lines(data$dateTime, data$Sub_metering_3, col="blue")
ltext <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=ltext, lty=c(1,1), bty="n", col=c("black", "red", "blue"))

#3rd graph
plot(data$dateTime, data$Voltage, type='n', xlab="datetime",ylab="Voltage")
lines(data$dateTime, data$Voltage)

#4th graph
plot(data$dateTime, data$Global_reactive_power, type='n', xlab="datetime",
     ylab="Global_reactive_power")
lines(data$dateTime, data$Global_reactive_power)
dev.off()