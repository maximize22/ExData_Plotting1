#set working directory
setwd('c:/devl/explore_data')
getwd()

#read file
load(paste0(getwd(),'/hh_power_plot.RData'))

#add DOW
ds$dow <- strtrim(weekdays(ds$f.date),3)

#plot 2
#frequency of global active power
png(filename = "plot2.png", width = 480, height = 480)
plot(ds$f.timestamp, ds$global.active.power, xlab="", ylab = 'Global Active Power (kilowatts)'
     ,type="n")
lines(ds$f.timestamp, ds$global.active.power, type="l", col='black')

dev.off()

