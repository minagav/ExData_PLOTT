# EXPLORATORY DATA   COURSE PROJECT 1
#
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
# Open png Device
png(file="plot1.png") 

#Make a histogram of the Data$Global_active_power, with the bars in red, with a title and label in x axis
hist(DF3$Global_active_power, col="red1", border="black", main = "Global Active Power",
     xlab = "Golabl Active Power (Kilowatts)")

# Clossing graphic device
dev.off()

