#### Plot 3 ####

## uploading data ##


# uploading the data, separating the text file by ";
powdata = read.table("household_power_consumption.txt", sep = ";")

# making the top row be the name of the columns
colnames(powdata) = as.character(unlist(powdata[1,]))
powdata = powdata[-1, ]

# getting the data for only the dates we care about; 2007-02-01, 2007-02-02
powdata1 = subset(powdata, Date == "1/2/2007" | Date == "2/2/2007" )

# changing factors into numbers
powdata1$Sub_metering_1 = as.numeric(as.character(powdata1$Sub_metering_1))
powdata1$Sub_metering_2 = as.numeric(as.character(powdata1$Sub_metering_2))
powdata1$Sub_metering_3 = as.numeric(as.character(powdata1$Sub_metering_3))

# creating the plot of sub metering vs days of the week
# then adding the other 2 submeting, adding color and legend
with(powdata1, plot(dow, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(powdata1$Sub_metering_3 ~ powdata1$dow, col =  "blue")
lines(powdata1$Sub_metering_2 ~ powdata1$dow, col = "red")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"), cex = .75)
png("plot3.png")
dev.off()