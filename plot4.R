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




#multi-panel graph
plot4 <- function() {
  par(mfrow=c(2,2))
  
  ##Plot 1
  plot(dffeb$timestamp,dffeb$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  ##Plot 2
  plot(dffeb$timestamp,dffeb$Voltage, type="l", xlab="Date & Time", ylab="Voltage")
  
  ##Plot 3
  plot(dffeb$timestamp,dffeb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(dffeb$timestamp,dffeb$Sub_metering_2,col="red")
  lines(dffeb$timestamp,dffeb$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
  
  #PLOT 4
  plot(dffeb$timestamp,dffeb$Global_reactive_power, type="l", xlab="Date & time", ylab="Global_reactive_power")
  
  #OUTPUT
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("plot4.png has been saved in", getwd())
}
