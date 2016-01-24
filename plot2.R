dane = read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors=F, na.strings = "?")
dane = subset(dane, (Date == "1/2/2007") | (Date == "2/2/2007"))
dane[,1] = paste(dane$Date, dane$Time, sep = " ")
dane$Date <- as.POSIXct(strptime(dane[,1], "%d/%m/%Y %H:%M:%S"))

png('plot5.png', width = 480, height = 480)

plot(dane$Date, dane$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()