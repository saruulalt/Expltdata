#load file
# 
# filename <- "household_power_consumption.txt"
# df <- read.table(filename,
#                  header=TRUE,
#                  sep=";",
#                  colClasses=c("character", "character", rep("numeric",7)),
#                  na="?")
# 
# 
# #converting date and time variables to Date/Time class
# df$Date <- as.Date(df$Date, "%d/%m/%Y")
# 
# #making sure to only use data from the dates 2007-02-01 and 2007-02-02
# dffeb <- df[(df$Date=="2007-02-01") | (df$Date=="2007-02-02"),]
# 
# #creating a new column as timestamp
# dffeb <- transform(dffeb, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")




#Energy sub metering
plot3 <- function() {
  plot(dffeb$timestamp,dffeb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(dffeb$timestamp,dffeb$Sub_metering_2,col="red")
  lines(dffeb$timestamp,dffeb$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("plot3.png has been saved in", getwd())
}