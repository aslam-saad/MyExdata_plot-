####
###
## 
#Loading the data

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
file <- file.path(getwd(), "data", "power.zip")
if (!file.exists(file)){
  download.file(url = url, destfile = "./data/power.zip")
  unzip("./data/power.zip", exdir = ./data )
}

data <- read.table(file = file.path(getwd(), "data", "household_power_consumption.txt"), 
                   quote = "", 
                   na.strings = "?", 
                   sep = ";",
                   header = T) 

data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]  
data$Date = as.Date(data$Date, format  = '%d/%m/%Y') 
data$TimeTime = strptime(paste(data$Date,data$Time), format = '%Y-%m-%d %H:%M:%S' )

####
###
##
# Making plots

##plot 4

png("plot4.png", height = 480, width = 480, units = "px")
par(mfcol = c(2,2))

plot(data$Time, data$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")

plot(data$Time, data$Sub_metering_1,
     type = "l",
     col = "black", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))

plot(data$Time, data$Voltage, 
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

plot(data$Time, data$Global_reactive_power,
     type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()
