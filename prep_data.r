rm(list = ls())

#set working directory
setwd('c:/devl/explore_data')
getwd()

#read file
dx <- read.table(file=paste0(getwd(),'/household_power_consumption.txt')
                 ,header = TRUE
                 ,sep = ';'
                 ,col.names = c('obs.date','obs.time','global.active.power','global.reactive.power','voltage','global.intensity','sub1','sub2','sub3')
                 ,nrows = 100000
                 , stringsAsFactors=FALSE)
ds <- subset(dx, dx$obs.date %in% c('1/2/2007','2/2/2007'))
ds$f.date <- strptime(ds$obs.date, format = "%d/%m/%Y")
ds$f.timestamp <- strptime(paste0(ds$obs.date, ' ', ds$obs.time), format = "%d/%m/%Y %H:%M:%S")
ds$global.active.power <- as.numeric(ds$global.active.power)
ds$global.reactive.power <- as.numeric(ds$global.reactive.power)
ds$voltage <- as.numeric(ds$voltage)
ds$global.intensity <- as.numeric(ds$global.intensity)
ds$sub1 <- as.numeric(ds$sub1)
ds$sub2 <- as.numeric(ds$sub2)
save(ds, file=paste0(getwd(),'/hh_power_plot.RData'))
