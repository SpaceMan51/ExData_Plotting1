## read in subset file of power data ( 2007-02-01 and 2007-02-02)
##
twodaypowerdatafile     <- "twodaypowerdata.txt"
twodaypowerdata <- read.table(twodaypowerdatafile, header= TRUE)

##combine Date and Time and convert to Date/Time format
twodaypowerdata$DateTime <- as.POSIXct(paste(twodaypowerdata$Date, twodaypowerdata$Time), format="%d/%m/%Y %H:%M:%S")

##Plot with 4 different plots
png('plot4.png',width=480, height=480)
par(mfrow=c(2,2))

plot(Global_active_power ~ DateTime, twodaypowerdata, type = "l", ylab="Global Active Power", xlab="")

plot(Voltage ~ DateTime, twodaypowerdata, type = "l", ylab="Voltage", xlab="datetime")

plot(Sub_metering_1 ~ DateTime, twodaypowerdata, type="l", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2 ~ DateTime, twodaypowerdata, type = "l", col="red", yaxt = "n")
lines(Sub_metering_3 ~ DateTime, twodaypowerdata, type = "l", col="blue", yaxt = "n")
legend("topright", lty=1, cex=0.75, lwd=3.0, pt.cex=1.0, pch="-", bty="n",
       col=c("black", "red", "blue"),
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(Global_reactive_power ~ DateTime, twodaypowerdata, type = "l", ylab="Global_reactive_power", xlab="datetime")

##create PNG

dev.off()