#plot4
# multiple plots
# between 2007-02-01 and 2007-02-02
library(data.table)

#load and subset the data
fullData = fread('household_power_consumption.txt', na.strings='?')
subsetData = subset(fullData, Date=="1/2/2007" | Date=="2/2/2007")

# transform data
Date_Time = strptime(paste(subsetData$Date, subsetData$Time), format='%d/%m/%Y %H:%M:%S')
Global_active_power = as.numeric(subsetData$Global_active_power)
Voltage = as.numeric(subsetData$Voltage)
Sub_metering_1 = as.numeric(subsetData$Sub_metering_1)
Sub_metering_2 = as.numeric(subsetData$Sub_metering_2)
Sub_metering_3 = as.numeric(subsetData$Sub_metering_3)
Global_reactive_power = as.numeric(subsetData$Global_reactive_power)

# plot
png("plot4.png",width=480,height=480,units="px")
par(mfrow = c(2, 2)) # order: top-left, top-right, bottom-left, bottom-right

# plotting global active power
plot(Date_Time,
     Global_active_power,
     type="l", # line chart instead of points
     xlab="",
     ylab="Global Active Power")

# plotting voltage
plot(Date_Time,
     Voltage,
     type="l", # line chart instead of points
     xlab="datetime",
     ylab="Voltage")

# plotting sub metering
plot(Date_Time,
     Sub_metering_1,
     type="l", # line chart instead of points
     xlab="",
     ylab="Energy sub metering")
lines(Date_Time, 
      Sub_metering_2,
      type="l",
      col="red"
)
lines(Date_Time, 
      Sub_metering_3,
      type="l",
      col="blue"
)
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1), # pch for dots
       bty = "n") # no border

# plotting global reactive power
plot(Date_Time,
     Global_reactive_power,
     type="l", # line chart instead of points
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
