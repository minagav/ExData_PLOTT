# EXPLORATORY DATA   COURSE PROJECT 1
#  PLOT 4
## Change working directory
# ================================================
setwd(paste(getwd(),"/COURSERA/DATOS", sep= ""))
# =================================================
## Asigning name and type of the data set to variable file
file <- c("household_power_consumption.txt")
# ====================================================
## Reading subset data to DF3
## Reading subset data to DF3
library(sqldf)
library(tcltk)
library(gsubfn)
library(proto)
library(RSQLite)
DF3 <- read.csv.sql(file, sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"',  header = TRUE, sep = ";")

#================================== MAKING GRAPHS=========================================
# Uploading lubridate library
library(lubridate)
# Open graphic device
png(file="plot4.png") 
# =========================================
# The time points must be shared by several subplots in the "X" axis 
time<-wday(DF3$Date, label = TRUE, abbr = TRUE)
# ==============================================
# We must arrange 4 figures in 2 rows and 2 columns
par(mfrow=c(2,2))
# =================================================
# Graph Time/ Global_active_power (xy plot)

Global_active_power <-DF3$Global_active_power

plot(Global_active_power , type="l",ylab = "Golabl Active Power ", xlab="", xaxt="n" )

axis(1, at=c(1,length(time)/2+1,length(time) ), 
     labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"),
     tck=-0.01)
#  ==================================================
# Graph Voltage/Time (xy plot)

Voltage<-DF3$Voltage

plot(Voltage , type="l",ylab = "Voltage", xlab="datetime", xaxt="n" )

axis(1, at=c(1,length(time)/2+1,length(time) ), 
     labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"),
     tck=-0.01)
# ==========================================================

# Graph Submetering_1_2_3/Time (xy plots in the same graph)

Sub_metering_1<-DF3$Sub_metering_1
Sub_metering_2<-DF3$Sub_metering_2
Sub_metering_3<-DF3$Sub_metering_3

plot(Sub_metering_1 , type="l",ylab = "Energy Sub metering", xlab="", col="black", xaxt="n" )
lines(Sub_metering_2, col="red1")
lines(Sub_metering_3, col="blue")

axis(1, at=c(1,length(y)/2+1,length(y) ), 
     labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"),               
     tck=-0.01)

legend("topright", inset=.05, bty=0,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, lty=1, col=c("black", "red1", "blue"),  horiz=FALSE)

# Subplot 4 Global Reactive power vs time
# ===================================================================
Global_reactive_power <-DF3$Global_reactive_power


plot(Global_reactive_power , type="l",xlab="datetime",  xaxt="n" )

axis(1, at=c(1,length(time)/2+1,length(time) ), 
     labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"),               
     tck=-0.01)