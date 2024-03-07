#### Data Load and Cleanup####

source_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
source_data <- subset(source_data, Date == "1/2/2007" | Date == "2/2/2007")

source_data$Date_Time <- paste(source_data$Date, source_data$Time)
source_data$Date_Time <- strptime(source_data$Date_Time, "%d/%m/%Y %H:%M:%S")
source_data$Date_Time <- as.numeric(source_data$Date_Time)

#### 4 Plots ####

par("mfcol" = c(2,2))
# 1
with(source_data, plot(Date_Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt = "n", ylim = c(0, 6)))
axis(side = 1, at = c(min(source_data$Date_Time), median(source_data$Date_Time), max(source_data$Date_Time)), labels = c("Thurs", "Fri", "Sat"))

# 2
with(source_data, plot(Date_Time, Sub_metering_1, type = "l",  col = "black", ylab = "Energy sub metering", xlab = "", ylim = c(0, 30), , xaxt = "n"))
par("new" = TRUE)
with(source_data, plot(Date_Time, Sub_metering_2, type = "l",  col = "red", ylab = "Energy sub metering", xlab = "", ylim = c(0, 30), , xaxt = "n"))
par("new" = TRUE)
with(source_data, plot(Date_Time, Sub_metering_3, type = "l", col = "blue", ylab = "Energy sub metering", xlab = "", ylim = c(0, 30), xaxt = "n"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .5)
axis(side = 1, at = c(min(source_data$Date_Time), median(source_data$Date_Time), max(source_data$Date_Time)), labels = c("Thurs", "Fri", "Sat"))

# 3
plot(source_data$Date_Time, source_data$Voltage, type = "l", col = "black", ylab = "Voltage", xlab = "datetime", xaxt = "n", ylim = c(234, 246))
axis(side = 1, at = c(min(source_data$Date_Time), median(source_data$Date_Time), max(source_data$Date_Time)), labels = c("Thurs", "Fri", "Sat"))

#4
plot(source_data$Date_Time, source_data$Global_reactive_power, type = "l", col = "black", ylab =  "Global_reactive_power", xlab =  "datetime", xaxt = "n", ylim = c(0.0, 0.5))
axis(side = 1, at = c(min(source_data$Date_Time), median(source_data$Date_Time), max(source_data$Date_Time)), labels = c("Thurs", "Fri", "Sat"))


#### Save as PNG ####

dev.copy(png, filename = "plot4.png", width = 480, height = 480)
dev.off()
