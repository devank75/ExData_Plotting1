getwd()
setwd("G:/Group strategic development/11 Reporting and Analytics/SanK/ExploratoryDataAnalysis/week1")
dir()
#install.packages("sqldf")
library(sqldf)
hhPowerCons = read.csv.sql ("household_power_consumption.txt", 
                         sep=";",
                         header = TRUE,
                         sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'")
head(hhPowerCons)
summary(hhPowerCons$Date)

# Change class of Date var from char to Date 
hhPowerCons$newdate <- as.Date(hhPowerCons$Date, format = "%d/%m/%Y")

# Join Date and Time variables for ploting purpose
hhPowerCons$DateTime <- as.POSIXct(paste(hhPowerCons$newdate, hhPowerCons$Time))


# plot3:
png("plot3.png", width = 480, height = 480)
plot(hhPowerCons$DateTime, hhPowerCons$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(hhPowerCons$DateTime, hhPowerCons$Sub_metering_2, type="l", col="red")
lines(hhPowerCons$DateTime, hhPowerCons$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()