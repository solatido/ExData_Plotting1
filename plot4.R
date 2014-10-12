outputpng <- "~/projects/datasciencecoursera/explore/a1/ExData_Plotting1/plot4.png"

# Download power consumption data and read into R (view code in prepData.R)
source("prepData.R")
data <- getPowerConsumptionDataFrame()

# Open png
png(file = outputpng, width = 480, height = 480)

# Write out graph
par(mfrow = c(2,2))
with(data, {
  plot(data$datetime, data$Global_active_power, type = "o", pch = "", xlab = "", ylab = "Global Active Power")
  plot(data$datetime, data$Voltage, type = "o", pch = "", xlab = "datetime", ylab = "Voltage")
  source("~/projects/datasciencecoursera/explore/a1/ExData_Plotting1/subMetering.R")
  plotSubMetering(data)
  plot(data$datetime, data$Global_reactive_power, type = "o", pch = "", xlab = "datetime", ylab = "Global_reactive_power")
})

# Close and save png
dev.off()