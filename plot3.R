plot3 <- function() {
  d <- loadData()
  png("plot3.png", width=480, heigh=480, units="px")
  plot(d$DateTime,d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(d$DateTime,d$Sub_metering_2,col="red")
  lines(d$DateTime,d$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1",
                                                    "Sub_metering_2", "Sub_metering_3"), 
                                                    lty=c(1,1), lwd=c(1,1))
  dev.off()
}

loadData <- function() {
  data <- read.table("household_power_consumption.txt",sep=";", header = T, na.strings = "?")
  data$Date=as.Date(data$Date, "%d/%m/%Y")
  d<-data[data$Date >= as.Date("2/1/2007","%m/%d/%Y") & data$Date <= as.Date("2/2/2007","%m/%d/%Y"),]
  d$DateTime <- as.POSIXct(paste(d$Date, d$Time), format="%Y-%m-%d %H:%M:%S")
  return(d)
}

plot3()