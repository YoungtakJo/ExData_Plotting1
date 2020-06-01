library(lubridate)

data <- read.table('exdata_data_household_power_consumption/household_power_consumption.txt', header=TRUE, sep=";")
data[,1] = as.Date(data[,1], format="%d/%m/%Y")

data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

data[,'DateTime'] = paste(as.character(data[,'Date']), as.character(data[,'Time']), sep=" ")
data[,'DateTime'] = ymd_hms(data[,'DateTime'])

plot(data$DateTime, as.numeric(data$Global_active_power)/1000, type='l', xlab="", ylab='Global Active Power (kilowatts)')