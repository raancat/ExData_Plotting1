par(mfcol=c(2,2))
par(mar=c(4,4,1,1))
## PLOT UPPER LEFT
plot2 <- mutate(power3, time_date=paste(new_date,Time))
plot2 <- mutate(plot2, Global_active_power=as.numeric(as.character(Global_active_power)))
plot2 <- filter(plot2, !is.na(Global_active_power))
plot2 <- mutate(plot2, time_date2=as.POSIXct(strptime(time_date, "%Y-%m-%d %H:%M:%S")))

plot(plot2$time_date2, plot2$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)", 
     cex.lab=0.75, cex.axis=0.75)
lines(plot2$time_date2, plot2$Global_active_power, type="l")

## PLOT LOWER LEFT
plot3 <- mutate(power3, time_date=paste(new_date,Time))
plot3 <- mutate(plot3, Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
plot3 <- filter(plot3, !is.na(Sub_metering_1))
plot3 <- mutate(plot3, Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
plot3 <- filter(plot3, !is.na(Sub_metering_2))
plot3 <- mutate(plot3, Sub_metering_3=as.numeric(as.character(Sub_metering_3)))
plot3 <- filter(plot3, !is.na(Sub_metering_3))
plot3 <- mutate(plot3, time_date2=as.POSIXct(strptime(time_date, "%Y-%m-%d %H:%M:%S")))

plot(plot3$time_date2, plot2$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering",
     cex.lab=0.75, cex.axis=0.75, ylim=c(0,38), yaxt="n")
ticks<-c(0,10,20,30)
axis(2, at=ticks, labels=ticks, cex.axis=0.75)
lines(plot3$time_date2, plot3$Sub_metering_1, type="l")
lines(plot3$time_date2, plot3$Sub_metering_2, type="l", col="red")
lines(plot3$time_date2, plot3$Sub_metering_3, type="l", col="blue")
legend("topright", pch="-", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2",
    "Sub_metering_3"), cex=0.5, lwd=1, lty=1, bty="n")

## UPPER RIGHT
plot4 <- mutate(power3, time_date=paste(new_date,Time))
plot4 <- filter(plot4, !is.na(Voltage))
plot4 <- mutate(plot4, time_date2=as.POSIXct(strptime(time_date, "%Y-%m-%d %H:%M:%S")))

plot(plot4$time_date2, plot4$Voltage, type="n", xlab="datetime", ylab="Voltage", 
     cex.lab=0.75, cex.axis=0.75, ylim=c(233,247), yaxt="n")
ticks <- c(234,238,242,246)
axis(2, at=ticks, labels=ticks, cex.axis=0.75)
lines(plot4$time_date2, plot4$Voltage, type="l")

#plot(plot4$time_date2, plot4$Voltage, type="l")

## LOWER RIGHT
plot4b <- mutate(power3, time_date=paste(new_date,Time))
plot4b <- mutate(plot4b, Global_reactive_power=as.numeric(as.character(Global_reactive_power)))
plot4b <- filter(plot4b, !is.na(Global_reactive_power))
plot4b <- mutate(plot4b, time_date2=as.POSIXct(strptime(time_date, "%Y-%m-%d %H:%M:%S")))

plot(plot4b$time_date2, plot4$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power", 
     cex.lab=0.75, cex.axis=0.75, ylim=c(0,0.5))
lines(plot4$time_date2, plot4$Global_reactive_power, type="l")

#plot(plot4$time_date2, plot4$Global_reactive_power, type="l")
