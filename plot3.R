plot3 = function(){
  #Read in and format the data
  consumpt = read.table("./household_power_consumption.txt", header=TRUE, sep=";", na = "?")
  library(lubridate)
  consumpt$Date <- as.Date(dmy(consumpt$Date))
  dat = subset(consumpt, consumpt$Date>=as.Date("2007-02-01") & consumpt$Date <= as.Date("2007-02-02"))
  dat$date_time = paste(dat$Date, dat$Time)
  dat$date_time = format.Date(dat$date_time, "%y-%m-%d %H:%M:%S")
  #plot the data
  plot(as.POSIXct(dat$date_time), dat$Sub_metering_1, type= "l", lwd = 1 ,xlab = "", ylab = "Energy sub metering")
  lines(as.POSIXct(dat$date_time),dat$Sub_metering_2, col="red", lwd = 1 )
  lines(as.POSIXct(dat$date_time),dat$Sub_metering_3, col="blue", lwd = 1 )
  legend("topright",c("Sub_metering1","Sub_metering2","Sub_metering3"), lwd=c(1,1,1), col = c("black", "red", "blue"))
  # save plot to device
  dev.copy(png, file="plot3.png")
  dev.off()
}