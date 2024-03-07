#### Data Load and Cleanup####

source_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
source_data <- subset(source_data, Date == "1/2/2007" | Date == "2/2/2007")

source_data$Date_Time <- paste(source_data$Date, source_data$Time)
source_data$Date_Time <- strptime(source_data$Date_Time, "%d/%m/%Y %H:%M:%S")
source_data$Date_Time <- as.numeric(source_data$Date_Time)


#### Plot 2 ####

plot2 <- with(source_data, plot(Date_Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n"))
axis(side = 1, at = c(min(source_data$Date_Time), median(source_data$Date_Time), max(source_data$Date_Time)), labels = c("Thurs", "Fri", "Sat"))


#### Save as PNG ####

dev.copy(png, filename = "plot2.png", width = 480, height = 480)
dev.off()