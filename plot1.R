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

hhPowerCons$newdate <- strptime(as.character(hhPowerCons$Date), "%d/%m/%Y")
format(hhPowerCons$newdate, "%Y-%m-%d")

hist(hhPowerCons$Global_active_power, col="red", main= "Global Active Power", xlab="Gloabal Active Power (kilowatts)")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA)
dev.off()
