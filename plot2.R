srcDir = "~/dataSci/expData/household_power_consumption.txt"
startDate = as.POSIXct("2007-02-01", format="%Y-%m-%d")
endDate = as.POSIXct("2007-02-03", format="%Y-%m-%d")
d <- read.delim(srcDir, sep=';') # read in data
d$DateTime <- as.POSIXct(paste(d[,1],d[,2]), format="%d/%m/%Y %H:%M:%S")
d1 <- subset(d, d$DateTime >= startDate & d$DateTime <= endDate) # get appropriate subset
d1 <- d1[order(d$DateTime),] # order by date
d1[,3] = as.numeric(levels(d1[,3]))[d1[,3]] #convert factors to numeric vectors with NAs
plot(d1$DateTime, d1[,3], type='l', xlab="", ylab="Global Active Power (killowatts)");