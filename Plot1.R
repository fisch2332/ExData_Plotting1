#### Plot 1 ####

## uploading data ##

# uploading the data, separating the text file by ";
powdata = read.table("household_power_consumption.txt", sep = ";")

# making the top row be the name of the columns
colnames(powdata) = as.character(unlist(powdata[1,]))
powdata = powdata[-1, ]

# getting the data for only the dates we care about; 2007-02-01, 2007-02-02
powdata1 = subset(powdata, Date == "1/2/2007" | Date == "2/2/2007" )

# creating a histogram of frequency and global active power
powdata1$Global_active_power = as.numeric(as.character(powdata1$Global_active_power))
hist(powdata1$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",
     main = "Global Active Power")

# saving plot as png
png("plot1.png")
dev.off()