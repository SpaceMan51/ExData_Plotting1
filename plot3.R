## read in subset file of power data ( 2007-02-01 and 2007-02-02)
##
twodaypowerdatafile     <- "twodaypowerdata.txt"
twodaypowerdata <- read.table(twodaypowerdatafile, header= TRUE)

##combine Date and Time and convert to Date/Time format
twodaypowerdata$DateTime <- as.POSIXct(paste(twodaypowerdata$Date, twodaypowerdata$Time), format="%d/%m/%Y %H:%M:%S")

##Plot with 3 different line graphs for each sub meter
with(twodaypowerdata, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(twodaypowerdata, lines(DateTime, Sub_metering_2, type = "l", col="red"))
with(twodaypowerdata, lines(DateTime, Sub_metering_3, type = "l", col="blue"))
#add legend
legend(cex=0.75, pt.cex=1.0, 
       "topright", pch="-", lwd="3",
       col=c("black", "red", "blue"),
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
       )

##create PNG
dev.copy(png, file="plot3.png")
dev.off()