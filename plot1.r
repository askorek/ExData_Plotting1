data = read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
data_filtered = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data_filtered$Date = as.Date(strptime(data_filtered$Date, '%d/%m/%Y'))
data_filtered$timetemp = paste(data_filtered$Date, data_filtered$Time)
data_filtered$Time = strptime(data_filtered$timetemp, format = "%Y-%m-%d %H:%M:%S")


png(file = "plot1.png")
hist(data_filtered$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()