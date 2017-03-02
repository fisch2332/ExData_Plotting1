#### Plot 2 ####

## uploading data ##


# uploading the data, separating the text file by ";
powdata = read.table("household_power_consumption.txt", sep = ";")

# making the top row be the name of the columns
colnames(powdata) = as.character(unlist(powdata[1,]))
powdata = powdata[-1, ]

# getting the data for only the dates we care about; 2007-02-01, 2007-02-02
powdata1 = subset(powdata, Date == "1/2/2007" | Date == "2/2/2007" )


# find days of the week (dow)
install.packages("lubridate")
library(lubridate)
powdata1$dow = paste(powdata1$Date, powdata1$Time)
powdata1$dow = dmy_hms(powdata1$dow)

# creating the plot for active power on y and days of week on x
with(powdata1, plot(dow, Global_active_power, type = "l", xlab = "" ,
                    ylab = "Global Active Power (kilowatts)"))
png("plot2.png")
dev.off()