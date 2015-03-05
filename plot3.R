srcDir = "~/dataSci/expData/household_power_consumption.txt"
startDate = as.POSIXct("2007-02-01", format="%Y-%m-%d")
endDate = as.POSIXct("2007-02-03", format="%Y-%m-%d")

# read in data
d <- read.delim(srcDir, sep=';') 
# create useasble date objects
d$DateTime <- as.POSIXct(paste(d[,1],d[,2]), format="%d/%m/%Y %H:%M:%S")
# get appropriate subset
d1 <- subset(d, d$DateTime >= startDate & d$DateTime <= endDate)
# order by date
d1 <- d1[order(d$DateTime),]

# convert factors to numeric vectors
d1$Sub_metering_1 = as.numeric(levels(d1$Sub_metering_1))[d1$Sub_metering_1]
d1$Sub_metering_2 = as.numeric(levels(d1$Sub_metering_2))[d1$Sub_metering_2]
d1$Sub_metering_3 = as.numeric(levels(d1$Sub_metering_3))[d1$Sub_metering_3]

plot(d1$DateTime, d1$Sub_metering_1, type='l', col='black', xlab="", sub="", ylab="Energy sub metering")
lines(d1$DateTime, d1$Sub_metering_2, type='l', col='red')
lines(d1$DateTime, d1$Sub_metering_3, type='l', col='blue')
legend(legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),x="topright", lwd=1, col=c("black","red","blue"))