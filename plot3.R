outputpng <- "~/projects/datasciencecoursera/explore/a1/ExData_Plotting1/plot3.png"

# Download power consumption data and read into R (view code in prepData.R)
source("prepData.R")
data <- getPowerConsumptionDataFrame()

# Open png
png(file = outputpng, width = 480, height = 480)

# Write out graph
source("~/projects/datasciencecoursera/explore/a1/ExData_Plotting1/subMetering.R")
plotSubMetering(data)

# Close and save png
dev.off()