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

### plot1
hist(as.numeric(data_focus$Global_active_power),
     xlab= 'Global active power (kilowatts)',
     ylab= 'Frequency',
     main= 'Global active power',
     col= 'red')

dev.copy(png,file= 'plot1.png')
dev.off()

