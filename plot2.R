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

# plot2:
png("plot2.png", width=480, height= 480)
plot(hhPowerCons$DateTime, hhPowerCons$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()