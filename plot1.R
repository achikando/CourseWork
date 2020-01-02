plot1 = function(){
  #Read in and format the data
  consumpt = read.table("./household_power_consumption.txt", header=TRUE, sep=";", na = "?")
  library(lubridate)
  consumpt$Date <- as.Date(dmy(consumpt$Date))
  dat = subset(consumpt, consumpt$Date>=as.Date("2007-02-01") & consumpt$Date <= as.Date("2007-02-02"))
  dat$Global_active_power = as.numeric(dat$Global_active_power)
  #plot the data
  hist(dat$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main ="Global Active Power")
  # save plot to device
  dev.copy(png, file="plot1.png")
  dev.off()
}