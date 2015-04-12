## read in subset file of power data ( 2007-02-01 and 2007-02-02)
##
twodaypowerdatafile     <- "twodaypowerdata.txt"
twodaypowerdata <- read.table(twodaypowerdatafile, header= TRUE)

##combine Date and Time and convert to Date/Time format
twodaypowerdata$DateTime <- as.POSIXct(paste(twodaypowerdata$Date, twodaypowerdata$Time), format="%d/%m/%Y %H:%M:%S")

##Plot with no xlab but with ylab
png('plot2.png',width=480, height=480)
with(twodaypowerdata, plot(DateTime, Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))

##create PNG
#dev.copy(png, file="plot2.png")
dev.off()