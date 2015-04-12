## read in subset file of power data ( 2007-02-01 and 2007-02-02)
##
twodaypowerdatafile     <- "twodaypowerdata.txt"
twodaypowerdata <- read.table(twodaypowerdatafile, header= TRUE)

##combine Date and Time and convert to Date/Time format
twodaypowerdata$DateTime <- as.POSIXct(paste(twodaypowerdata$Date, twodaypowerdata$Time), format="%d/%m/%Y %H:%M:%S")

##Plot with 4 different plots
par(mfrow=c(2,2))

with(twodaypowerdata, plot(DateTime, Global_active_power, type = "l", ylab="Global Active Power", xlab=""))

with(twodaypowerdata, plot(DateTime, Voltage, type = "l", ylab="Voltage", xlab="datetime"))

with(twodaypowerdata, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(twodaypowerdata, lines(DateTime, Sub_metering_2, type = "l", col="red"))
with(twodaypowerdata, lines(DateTime, Sub_metering_3, type = "l", col="blue"))
legend("topright", cex=0.75, lwd=3.0, pt.cex=1.0, pch="-", bty="n",
       col=c("black", "red", "blue"),
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

with(twodaypowerdata, plot(DateTime, Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime"))


##create PNG
dev.copy(png, file="plot4.png")
dev.off()