library(lubridate)

data <- read.table('exdata_data_household_power_consumption/household_power_consumption.txt', header=TRUE, sep=";")
data[,1] = as.Date(data[,1], format="%d/%m/%Y")

data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

data[,'DateTime'] = paste(as.character(data[,'Date']), as.character(data[,'Time']), sep=" ")
data[,'DateTime'] = ymd_hms(data[,'DateTime'])

png("plot4.png",width = 480, height = 480,unit="px")
par(mfrow=c(2,2))
plot(data$DateTime, as.numeric(data$Global_active_power)/1000, type='l', xlab="", ylab='Global Active Power (kilowatts)')

plot(data$DateTime, as.numeric(data$Voltage), type='l', xlab="datetime", ylab='Voltage')

plot(data$DateTime, data$Sub_metering_1, type='l', xlab="", ylab='Energy sub metering', ylim=c(0,38))
par(new=TRUE)
plot(data$DateTime, data$Sub_metering_2, col='red', type='l', xlab="", ylab="", ylim=c(0,38))
par(new=TRUE)
plot(data$DateTime, data$Sub_metering_3, col='blue', type='l', xlab="", ylab="", ylim=c(0,38))
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), cex=0.5, pch=c('-','-','-'), col=c('black', 'red', 'blue'))

par(new=FALSE)
plot(data$DateTime, as.numeric(data$Global_reactive_power), type='l', xlab="datetime", ylab='Global_reactive_power')

dev.off()