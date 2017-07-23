#set working directory
setwd('c:/devl/explore_data')
getwd()

#read file
load(paste0(getwd(),'/hh_power_plot.RData'))

#add DOW
ds$dow <- strtrim(weekdays(ds$f.date),3)

#plot 3
#frequency of global active power
png(filename = "plot3.png", width = 480, height = 480)
plot(ds$f.timestamp, ds$sub1, type="n", xlab = "", ylab="Energy Sub Metering")
lines(ds$sub1, ds$f.timestamp, type = "l", col = 'black')
lines(ds$f.timestamp, ds$sub1, type = "l", col = 'black')
lines(ds$f.timestamp, ds$sub2, type = "l", col = 'red')
lines(ds$f.timestamp, ds$sub3, type = "l", col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

