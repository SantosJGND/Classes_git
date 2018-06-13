
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


par(mfrow= c(1,1))

### plot2

plot(strptime(dateTime1,format= "%d/%m/%Y %H:%M:%S"),
     data_focus$Global_active_power,
     type= 'l',
     ylab= 'Global active power (kilowatts)',
     xlab= "Date",
     main= "")

dev.copy(png,file= 'plot2.png')
dev.off()

