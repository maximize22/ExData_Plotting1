#set working directory
setwd('c:/devl/explore_data')
getwd()

#read file
load(paste0(getwd(),'/hh_power_plot.RData'))

#add DOW
ds$dow <- strtrim(weekdays(ds$f.date),3)

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
#quad1
plot(ds$f.timestamp, ds$global.active.power, xlab="", ylab = 'Global Active Power (kilowatts)'
     ,type="n")
lines(ds$f.timestamp, ds$global.active.power, type="l", col='black')

#quad2
plot(ds$f.timestamp, ds$voltage, xlab="datetime", ylab = 'Voltage'
     ,type="n")
lines(ds$f.timestamp, ds$voltage, type="l", col='black')

#quad 3
plot(ds$f.timestamp, ds$sub1, type="n", xlab = "", ylab="Energy Sub Metering")
lines(ds$f.timestamp, ds$sub1, type = "l", col = 'black')
lines(ds$f.timestamp, ds$sub2, type = "l", col = 'red')
lines(ds$f.timestamp, ds$sub3, type = "l", col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#quad4
plot(ds$f.timestamp, ds$global.reactive.power, xlab="datetime", ylab = 'Global_reactive_power'
     ,type="n")
lines(ds$f.timestamp, ds$global.reactive.power, type="l", col='black')

dev.off()

