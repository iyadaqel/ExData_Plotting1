file <- read.table(file="household_power_consumption.txt", sep=";", header=T, colClasses=c('character' , 'character' , 'character' , 'character' ,'character' , 'character' ,'character' , 'character' ,"character") , nrows=3500 , skip = 66500 , stringsAsFactors = FALSE )
colnames(file) <- c('Date' , 'Time' , 'Global_active_power' , 'Global_reactive_power' , 'Voltage' , 'Global_intensity' , 'Sub_metering_1' , 'Sub_metering_2' , 'Sub_metering_3')
file <- subset(file , Date %in% c('1/2/2007' , '2/2/2007'))
file$Date <- as.Date(file$Date , '%d/%m/%Y')
file[,3:9] <- lapply(file[,3:9],as.numeric)
png('plot1.png' , width= 480 , height = 480)
hist(file$Global_active_power , col='red' , main='Global Active Power' , xlab='Global Active Power (killowats)')
dev.off()