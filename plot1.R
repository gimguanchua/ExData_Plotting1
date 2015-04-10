#plot1
# histogram of Global_active_power
# between 2007-02-01 and 2007-02-02
library(data.table)

#load and subset the data
fullData = fread('household_power_consumption.txt', na.strings='?')
subsetData = subset(fullData, Date=="1/2/2007" | Date=="2/2/2007")

# transform data
Global_active_power = as.numeric(subsetData$Global_active_power)

# plot
png("plot1.png",width=480,height=480,units="px")
hist(
  Global_active_power,
  col="red",
  main="Global Active Power", 
  xlab="Global Active Power (kilowatts)",
  ylab="Frequency"
)
dev.off()
