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