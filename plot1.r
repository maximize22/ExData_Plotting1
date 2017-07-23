#set working directory
setwd('c:/devl/explore_data')
getwd()

#read file
load(paste0(getwd(),'/hh_power_plot.RData'))

#plot 1
#frequency of global active power
range(ds$global.active.power)
breaks <- seq(0, 7.5, by=0.5)
intvl.cut <- cut(ds$global.active.power, breaks, labels = breaks[-1], right=FALSE)
intvl.frq <- table(intvl.cut)
png(filename = "plot1.png", width = 480, height = 480)

barplot(intvl.frq, main = "Global Active Power", xlab = 'Global Active Power (kilowatts)',
          ylab = 'Frequency', axisnames = TRUE, col = 'red')
dev.off()

