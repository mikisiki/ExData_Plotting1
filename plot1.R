dane = read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors=F, na.strings = "?")
dane = subset(dane, (Date == "1/2/2007") | (Date == "2/2/2007"))
dane[,1] = paste(dane$Date, dane$Time, sep = " ")
dane$Date <- as.POSIXct(strptime(dane[,1], "%d/%m/%Y %H:%M:%S"))

png('plot1.png', width = 480, height = 480)
par(bg = NA)
hist(dane$Global_active_power, main = "Global active power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()
