## read in subset file of power data ( 2007-02-01 and 2007-02-02)
##
twodaypowerdatafile     <- "twodaypowerdata.txt"
twodaypowerdata <- read.table(twodaypowerdatafile, header= TRUE)

##combine Date and Time and convert to Date/Time format
twodaypowerdata$DateTime <- as.POSIXct(paste(twodaypowerdata$Date, twodaypowerdata$Time), format="%d/%m/%Y %H:%M:%S")

##Plot histogram to show frequency of Global_active_power values
hist(twodaypowerdata$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

##create PNG
dev.copy(png, file="plot1.png")
dev.off()