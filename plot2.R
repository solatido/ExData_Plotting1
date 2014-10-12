outputpng <- "~/projects/datasciencecoursera/explore/a1/ExData_Plotting1/plot2.png"

# Download power consumption data and read into R (view code in prepData.R)
source("prepData.R")
data <- getPowerConsumptionDataFrame()

# Open png
png(file = outputpng, width = 480, height = 480)

# Write out graph
plot(data$datetime, data$Global_active_power, type = "o", pch = "", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close and save png
dev.off()