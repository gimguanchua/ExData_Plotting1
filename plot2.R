#plot2
# line chart of Global_active_power
# between 2007-02-01 and 2007-02-02
library(data.table)

#load and subset the data
fullData = fread('household_power_consumption.txt', na.strings='?')
subsetData = subset(fullData, Date=="1/2/2007" | Date=="2/2/2007")

# transform data
Date_Time = strptime(paste(subsetData$Date, subsetData$Time), format='%d/%m/%Y %H:%M:%S')
Global_active_power = as.numeric(subsetData$Global_active_power)

# plot
png("plot2.png",width=480,height=480,units="px")
plot(Date_Time,
     Global_active_power,
     type="l", # line chart instead of points
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
