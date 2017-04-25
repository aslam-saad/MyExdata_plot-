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
data$TimeTime = strptime(paste(data$Date, data$Time), format = '%Y-%m-%d %H:%M:%S' )

####
###
##
# Making plots

##plot2

png("plot2.png", height = 480, width = 480, units = "px")
plot(data$Time, data$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")
dev.off()

