# EXPLORATORY DATA --  COURSE PROJECT 1 -- PLOT 2
#
## Change working directory
# ================================================
setwd(paste(getwd(),"/COURSERA/DATOS", sep= ""))
# =================================================
## Asigning name and type of the data set to variable file
file <- c("household_power_consumption.txt")
# ====================================================
## Reading subset data to DF3
library(sqldf)
library(tcltk)
DF3 <- read.csv.sql(file, sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"',  header = TRUE, sep = ";")
#
# Uploading lubridate library
library(lubridate)
#
#================================== MAKIN GRAPHS=========================================
# Open graphic device
png(file="plot2.png") 

# X axis of data is going to be time in days of the week
time <-wday(DF3$Date, label = TRUE, abbr = TRUE)

# y axis of data is going to be the Global active power
Global_active_power <-DF3$Global_active_power

# Create xy plot
plot(Global_active_power , type="l", ylab = "Golabl Active Power (Kilowatts)", xlab="", xaxt="n" )

# Costumize the x axis of the plot. Therefor, we previously set xaxt="n"
axis(1, at=c(1,length(time)/2+1,length(time) ), 
     labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"), 
     tck=-0.01)

# Close device
dev.off()