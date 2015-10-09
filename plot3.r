data = read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
data_filtered = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data_filtered$Date = as.Date(strptime(data_filtered$Date, '%d/%m/%Y'))
data_filtered$timetemp = paste(data_filtered$Date, data_filtered$Time)
data_filtered$Time = strptime(data_filtered$timetemp, format = "%Y-%m-%d %H:%M:%S")

png(file = "plot3.png")
plot(data_filtered$Time, data_filtered$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = 'l', col = "black")
points(data_filtered$Sub_metering_2, type = 'l', col = "red")
points(data_filtered$Time, data_filtered$Sub_metering_2, type = 'l', col = "red")
points(data_filtered$Time, data_filtered$Sub_metering_3, type = 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

dev.off()