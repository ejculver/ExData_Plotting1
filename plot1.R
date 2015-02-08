plot1 <- function() {
  d <- loadData()
  png("plot1.png", width=480, heigh=480, units="px")
  hist(d$Global_active_power, xlab = "Global Active Power (kilowatts)",
       main = "Global Active Power", col = "red")
  dev.off()
}

loadData <- function() {
  data <- read.table("household_power_consumption.txt",sep=";", header = T, na.strings = "?")
  data$Date=as.Date(data$Date, "%d/%m/%Y")
  d<-data[data$Date >= as.Date("2/1/2007","%m/%d/%Y") & data$Date <= as.Date("2/2/2007","%m/%d/%Y"),]
  return(d)
}

plot1()