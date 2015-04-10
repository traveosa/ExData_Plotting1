library(dplyr)

#read in data
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

#convert Date variable to POSIXct
housepower <- transform(household_power_consumption, Date = as.Date(household_power_consumption$Date, format = "%d/%m/%Y"))

#Extract only necessary dates
housepower2 <- filter(housepower, Date == "2007-02-01" | Date == "2007-02-02")

#Combine Date and Time to one variable, datetime
housepower3 <- transform(housepower2, datetime = strptime(paste(housepower2$Date, housepower2$Time), "%Y-%m-%d %H:%M:%S"))

#create histogram for plot1
hist(as.numeric(housepower3$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#write histogram as file
png("Exploratory Data Analysis/Proj 1/plot1.png")
hist(as.numeric(housepower3$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

#create line plot for plot2
plot(housepower3$datetime, housepower2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#write line plot for plot2 as file
png("Exploratory Data Analysis/Proj 1/plot2.png")
plot(housepower3$datetime, housepower2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

#create plot 3
with(housepower3, plot(datetime, Sub_metering_1, type = "l"))
with(housepower3, lines(Sub_metering_2 ~ datetime, col = "red"))
with(housepower3, lines(Sub_metering_3 ~ datetime, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#write plot 3 to a file
png("Exploratory Data Analysis/Proj 1/plot3.png")
with(housepower3, plot(datetime, Sub_metering_1, type = "l"))
with(housepower3, lines(Sub_metering_2 ~ datetime, col = "red"))
with(housepower3, lines(Sub_metering_3 ~ datetime, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

#create plot 4
par(mfrow = c(2, 2))
with(housepower3, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(housepower3, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(housepower3, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(housepower3, lines(Sub_metering_2 ~ datetime, col = "red"))
with(housepower3, lines(Sub_metering_3 ~ datetime, col = "blue"))
legend("topright", bty = "n", y.intersp = 1, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(housepower3, plot(datetime, Global_reactive_power, type = "l"))

#write plot 4 to a file
png("Exploratory Data Analysis/Proj 1/plot4.png")
par(mfrow = c(2, 2))
with(housepower3, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(housepower3, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(housepower3, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(housepower3, lines(Sub_metering_2 ~ datetime, col = "red"))
with(housepower3, lines(Sub_metering_3 ~ datetime, col = "blue"))
legend("topright", bty = "n", y.intersp = 1, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(housepower3, plot(datetime, Global_reactive_power, type = "l"))
dev.off()