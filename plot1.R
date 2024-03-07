#### Data Load and Cleanup####

source_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
source_data <- subset(source_data, Date == "1/2/2007" | Date == "2/2/2007")

source_data$Date <- as.Date(source_data$Date, "%d/%m/%Y")

#source_data$Time <- strptime(source_data$Time, format = "%H:%M:%S")

#### Plot 1 ####

plot1 <- hist(source_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")


#### Save as PNG ####

png(filename = "plot1.png", width = 480, height = 480)
with(source_data, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()