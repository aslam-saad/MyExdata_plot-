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

##Plot 1

png(filename='plot1.png', width=480, height=480, units='px')
hist(data$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (Kilowatts)", 
     main = "Global Active Power")
dev.off()













  
  




