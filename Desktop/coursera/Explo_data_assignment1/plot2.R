install.packages("dplyr")         #installing required packages
library(dplyr)
epc <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")     # reading data
FullTimeDate <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")   # combining data and time together
epc <- cbind(epc, FullTimeDate)
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")                #converting each class to proper class
epc$Time <- format(epc$Time, format = "%H:%M:%S")
epc$Global_active_power <- as.numeric(epc$Global_active_power)    
epc$Global_reactive_power <- as.numeric(epc$Global_reactive_power)
epc$Voltage <- as.numeric(epc$Voltage)
epc$Global_intensity <- as.numeric(epc$Global_intensity)
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)
subsetdata <- subset(epc, Date == "2007-02-01" | Date == "2007-02-02" )              # subsetting data for 2 required days
png('plot2.png', width = 480, height = 480)
with(subsetdata, plot(FullTimeDate, Global_active_power, type = "l", ylab = "Global Active Power"))
dev.off()