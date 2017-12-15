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




#Second plot: Global Active Power & Date
plot2 <- function() {
  plot(dffeb$timestamp,dffeb$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png has been saved in", getwd())
}