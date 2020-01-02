plot2 = function(){
  #Read in and format the data
  consumpt = read.table("./household_power_consumption.txt", header=TRUE, sep=";", na = "?")
  library(lubridate)
  consumpt$Date <- as.Date(dmy(consumpt$Date))
  dat = subset(consumpt, consumpt$Date>=as.Date("2007-02-01") & consumpt$Date <= as.Date("2007-02-02"))
  dat$date_time = paste(dat$Date, dat$Time)
  dat$date_time = format.Date(dat$date_time, "%y-%m-%d %H:%M:%S")
  #plot the data
  plot(as.POSIXct(dat$date_time), dat$Global_active_power, type= "l", lwd = 2 ,xlab = "", ylab = "Global Active Power (Kilowatts)")
  # save plot to device
  dev.copy(png, file="plot2.png")
  dev.off()
}