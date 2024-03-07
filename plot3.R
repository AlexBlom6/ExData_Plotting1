#### Data Load and Cleanup####

source_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
source_data <- subset(source_data, Date == "1/2/2007" | Date == "2/2/2007")

source_data$Date_Time <- paste(source_data$Date, source_data$Time)
source_data$Date_Time <- strptime(source_data$Date_Time, "%d/%m/%Y %H:%M:%S")
source_data$Date_Time <- as.numeric(source_data$Date_Time)

#### Plot 3 ####
#par("new" = TRUE)
plot3 <- with(source_data, plot(Date_Time, Sub_metering_1, type = "l",  col = "black", ylab = "Energy sub metering", xlab = "", ylim = c(0, 40), , xaxt = "n"))
par("new" = TRUE)
with(source_data, plot(Date_Time, Sub_metering_2, type = "l",  col = "red", ylab = "Energy sub metering", xlab = "", ylim = c(0, 40), , xaxt = "n"))
par("new" = TRUE)
with(source_data, plot(Date_Time, Sub_metering_3, type = "l", col = "blue", ylab = "Energy sub metering", xlab = "", ylim = c(0, 40), xaxt = "n"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side = 1, at = c(min(source_data$Date_Time), median(source_data$Date_Time), max(source_data$Date_Time)), labels = c("Thurs", "Fri", "Sat"))


#### Save as PNG ####

dev.copy(png, filename = "plot3.png", width = 480, height = 480)
dev.off()
