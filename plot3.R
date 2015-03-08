# EXPLORATORY DATA   COURSE PROJECT 1
#  PLOT 3
## Change working directory
# ================================================
setwd(paste(getwd(),"/COURSERA/DATOS", sep= ""))
# =================================================
## Asigning name and type of the data set to variable file
file <- c("household_power_consumption.txt")
# ====================================================
## Reading subset data to DF3
DF3 <- read.csv.sql(file, sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"',  header = TRUE, sep = ";")

#================================== MAKIN GRAPHS=========================================
# Open plot device
png(file="plot3.png") 
# ========================================================
# Set "X" axis time in week days 
time<-wday(DF3$Date, label = TRUE, abbr = TRUE)
# ===========================================================
# The "y" data points are DF3$Sub_metering_1, DF3$Sub_metering_2, DF3$Sub_metering_3
# =============================================================
sub_metering_1<-DF3$Sub_metering_1
sub_metering_2<-DF3$Sub_metering_2
sub_metering_3<-DF3$Sub_metering_3
# ================================================
# The three different plots are drawn in the same graph in different colors for Sub_metering_1_2_3
plot(sub_metering_1 , type="l",ylab = "Energy Sub metering", xlab="", col="black", xaxt="n" )
lines(sub_metering_2, col="red1")
lines(sub_metering_3, col="blue")
# ================================================
#Costumize x axis
axis(1, at=c(1,length(time)/2+1,length(time) ), 
     labels=c( toString(time[1]), toString(time[length(y)/2+1]), "Sat"),               
     tck=-0.01)
# ======================================================================
#Add the legend of the plots 
legend("topright", inset=.001,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, lty=1, col=c("black", "red1", "blue"),  horiz=FALSE)