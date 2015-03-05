srcDir = "~/dataSci/expData/household_power_consumption.txt"
startDate = as.POSIXct("2007-02-01", format="%Y-%m-%d")
endDate = as.POSIXct("2007-02-03", format="%Y-%m-%d")
d <- read.delim(srcDir, sep=';') # read in data
d$DateTime <- as.POSIXct(paste(d[,1],d[,2]), format="%d/%m/%Y %H:%M:%S")
d1 <- subset(d, d$DateTime >= startDate & d$DateTime <= endDate) # get appropriate subset
d1 <- d1[order(d$DateTime),] # order by date
d1$Global_active_power = as.numeric(levels(d1$Global_active_power))[d1$Global_active_power]
d1$Sub_metering_1 = as.numeric(levels(d1$Sub_metering_1))[d1$Sub_metering_1]
d1$Sub_metering_2 = as.numeric(levels(d1$Sub_metering_2))[d1$Sub_metering_2]
d1$Voltage = as.numeric(levels(d1$Voltage))[d1$Voltage]

par(mfrow=c(2,2)) # setup 2x2 plot grid

# FIRST PLOT
hist(d1$Global_active_power, xlab="Global Active Power (killowatts)", col="red", axes=TRUE, main="Global Active Power")

# SECOND PLOT
plot(d1$DateTime, d1$Voltage, type='l', col='black', xlab="datetime", sub="", ylab="Voltage")

# THIRD PLOT
plot(d1$DateTime, d1$Sub_metering_1, type='l', col='black', xlab="", sub="", ylab="Energy sub metering")
lines(d1$DateTime, d1$Sub_metering_2, type='l', col='red')
lines(d1$DateTime, d1$Sub_metering_3, type='l', col='blue')
legend(legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),x="topright", lwd=1, col=c("black","red","blue"), bty="n",cex=.65)

# FOURTH PLOT
plot(d1$DateTime, d1$Global_reactive_power, type='l', col='black', xlab="datetime", sub="", ylab="Global_reactive_power")
