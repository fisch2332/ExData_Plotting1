#### Plot 4 ####


## uploading data ##


# uploading the data, separating the text file by ";
powdata = read.table("household_power_consumption.txt", sep = ";")

# making the top row be the name of the columns
colnames(powdata) = as.character(unlist(powdata[1,]))
powdata = powdata[-1, ]

# getting the data for only the dates we care about; 2007-02-01, 2007-02-02
powdata1 = subset(powdata, Date == "1/2/2007" | Date == "2/2/2007" )

#changing various factors into numbers
powdata1$Voltage = as.numeric(as.character(powdata1$Voltage))
powdata1$Global_reactive_power = as.numeric(as.character(powdata1$Global_reactive_power))
# adjusting the way plots are viewed.  2 plots by 2 plots, margin sizes, outside margin
# sizes
par(mfrow = c(2, 2), mar = c(4,4,2,1), oma = c(0,0,2,0))

# creating all 4 plots and adjusting them accordingly
with(powdata1, {
        plot(dow, Global_active_power, type = "l", xlab = "",
             ylab = "Global Active Power (kilowatts)")
        plot(dow, Voltage, type = "l", xlab = "datatime", ylab = "Voltage")
        plot(dow, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(powdata1$Sub_metering_3 ~ powdata1$dow, col =  "blue")
        lines(powdata1$Sub_metering_2 ~ powdata1$dow, col = "red")
        legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty = 1, col = c("black", "red", "blue", cex = .75))
        plot(dow, Global_reactive_power, xlab = "gatatime", type = "l")
        
})
png("plot4.png")
dev.off()
