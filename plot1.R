data <- read.table('exdata_data_household_power_consumption/household_power_consumption.txt', header=TRUE, sep=";")
data[,1] = as.Date(data[,1], format="%d/%m/%Y")

data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

hist(as.numeric(data$Global_active_power)/1000, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')