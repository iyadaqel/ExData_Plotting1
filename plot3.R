file <- read.table(file="household_power_consumption.txt", sep=";", header=T, colClasses=c('character' , 'character' , 'character' , 'character' ,'character' , 'character' ,'character' , 'character' ,"character") , nrows=3500 , skip = 66500 , stringsAsFactors = FALSE )
colnames(file) <- c('Date' , 'Time' , 'Global_active_power' , 'Global_reactive_power' , 'Voltage' , 'Global_intensity' , 'Sub_metering_1' , 'Sub_metering_2' , 'Sub_metering_3')
file <- subset(file , Date %in% c('1/2/2007' , '2/2/2007'))
file[,3:9] <- lapply(file[,3:9],as.numeric)
dateandtime <- paste(file$Date , file$Time)
file$DateTime <- strptime(dateandtime , format='%d/%m/%Y %H:%M:%S') 
png('plot3.png' , width= 480 , height = 480)
plot(file$DateTime , file$Sub_metering_1 , type='l' , ylab='Energy sub meternic' ,  xlab='')
lines(file$DateTime , file$Sub_metering_2 , col='red' )
lines(file$DateTime , file$Sub_metering_3 , col='blue' )
legend('topright' , lty=1 , col=c('black' , 'red' , 'blue') , legend=c('Sub_metering_1' , 'Sub_metering_2' , 'Sub_metering_3'))
dev.off()


