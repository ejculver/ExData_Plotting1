plot2 <- function() {
  d <- loadData()
  png("plot2.png", width=480, heigh=480, units="px")
  plot(d$DateTime,d$Global_active_power, type= "l",xlab = "",ylab = "Global Active Power (kilowatts)" )
  dev.off()
}

loadData <- function() {
  data <- read.table("household_power_consumption.txt",sep=";", header = T, na.strings = "?")
  data$Date=as.Date(data$Date, "%d/%m/%Y")
  d<-data[data$Date >= as.Date("2/1/2007","%m/%d/%Y") & data$Date <= as.Date("2/2/2007","%m/%d/%Y"),]
  d$DateTime <- as.POSIXct(paste(d$Date, d$Time), format="%Y-%m-%d %H:%M:%S")
  return(d)
}

plot2()