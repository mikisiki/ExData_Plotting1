dane = read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors=F, na.strings = "?")
dane = subset(dane, (Date == "1/2/2007") | (Date == "2/2/2007"))
dane[,1] = paste(dane$Date, dane$Time, sep = " ")
dane$Date <- as.POSIXct(strptime(dane[,1], "%d/%m/%Y %H:%M:%S"))

png('plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))

plot(dane$Date, dane$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")

plot(dane$Date, dane$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

plot(dane$Date, dane$Sub_metering_1, type = "l", col = "black", xlab = "",
     ylab = "Energy sub metering" )
points(dane$Date, dane$Sub_metering_2, type = "l", col = "red")
points(dane$Date, dane$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"), 
       lwd = c("2", "2", "2"), col = c("black", "red", "blue"))

plot(dane$Date, dane$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")


dev.off()