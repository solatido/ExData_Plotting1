outputpng <- "~/projects/datasciencecoursera/explore/a1/ExData_Plotting1/plot1.png"

# Download power consumption data and read into R (view code in prepData.R)
source("prepData.R")
data <- getPowerConsumptionDataFrame()

# Open png
png(file = outputpng, width = 480, height = 480)

# Write out graph
hist(dat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close and save png
dev.off()