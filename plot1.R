srcDir = "~/dataSci/expData/household_power_consumption.txt"
startDate = as.Date("2007-02-01")
endDate = as.Date("2007-02-02")
d <- read.delim(srcDir, sep=';') # read in data
d$Date <- as.Date(d$Date, format="%d/%m/%Y") # convert dqaqte column to date object values
d1 <- subset(d, d$Date >= startDate & d$Date <= endDate) # get appropriate subset
d2 = as.numeric(levels(d1[,3]))[d1[,3]] #convert factors to numeric vectors with NAs
hist(d2, xlab="Global Active Power (killowatts)", col="red", axes=TRUE, main="Global Active Power")