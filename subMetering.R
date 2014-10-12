plotSubMetering <- function(data) {
  plot(data$datetime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(data$datetime, data$Sub_metering_1, col = "black")
  lines(data$datetime, data$Sub_metering_2, col = "red")
  lines(data$datetime, data$Sub_metering_3, col = "blue")
  legend(legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), x = "topright", col = c("black", "red", "blue"), lty = 1)
}