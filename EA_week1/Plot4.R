
### read data
household_data <- read.table("household_power_consumption.txt",sep= ';',header= T)

### clean data:
## course says we'll only need data between the dates 2007-02-01 and 2007-02-02.
data_focus <- household_data[as.character(household_data$Date) %in% c("1/2/2007","2/2/2007"),]

## work with numeric values only
data_focus[,3:length(data_focus)] = apply(data_focus[,3:length(data_focus)],2,as.numeric)

## switch date and time to numeric, create concatenated vector.
data_focus[,1:2] <- apply(data_focus[,1:2],2,as.character)

dateTime1 <- paste(data_focus[,1],data_focus[,2],sep =' ')

### plot4

par(mfrow= c(2,2),mar= c(4,5,.5,.5))

# upper left
plot(strptime(dateTime1,format= "%d/%m/%Y %H:%M:%S"),
     type= 'l',
     data_focus$Global_active_power,
     xlab= '',
     ylab= 'Global active power (kilowatts)',cex.lab= .8)

# upper right
plot(strptime(dateTime1,format= "%d/%m/%Y %H:%M:%S"),
     type= 'l',
     data_focus$Voltage,
     ylab= 'Voltage',
     xlab= 'datetime',cex.lab= .8)

## lower left
plot(strptime(dateTime1,format= "%d/%m/%Y %H:%M:%S"),
     data_focus$Sub_metering_1,
     xlab= '',
     ylab= 'Energy sub metering',
     type= 'l',cex.lab= .8)

points(strptime(dateTime1,format= "%d/%m/%Y %H:%M:%S"),
       data_focus$Sub_metering_3,
       col= 'red',
       type= 'l')

points(strptime(dateTime1,format= "%d/%m/%Y %H:%M:%S"),
       data_focus$Sub_metering_2,
       col= 'blue',
       type= 'l')

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"), lty=1, cex=0.8)

## lower right.

plot(strptime(dateTime1,format= "%d/%m/%Y %H:%M:%S"),
     type= 'l',
     data_focus$Global_reactive_power,
     xlab= 'datetime',
     ylab= 'Global_reactive_power',cex.lab= .8)


dev.copy(png,file= 'plot4.png')
dev.off()
