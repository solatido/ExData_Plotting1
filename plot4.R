require(sqldf)

setwd("~/projects/datasciencecoursera/explore/a1/ExData_Plotting1")

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
selectOnlyDates <- "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007')"
outputpng <- "plot4.png"

# Download data to temp file, unzip, read in data to R, remove temp file
tmpzippedfile <- tempfile()
#download.file(fileURL, tmpzippedfile, method = "curl")
tmpdir <- tempdir()
#unzippedData <- unzip(tmpzippedfile, exdir = tmpdir)
unzippedData = "~/projects/datasciencecoursera/explore/a1/household_power_consumption.txt"
#dat <- read.csv.sql(unzippedData, sql = selectOnlyDates, sep = ";", header = TRUE)
unlink(tmpzippedfile)
unlink(tmpdir)

# Open png, write out graph, close png
png(file=outputpng,width = 480, height = 480)

# Add datetime column
dat$datetime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
with(dat, {
plot(dat$datetime, dat$Global_active_power, type = "o", pch = "", xlab = "", ylab = "Global Active Power")
plot(dat$datetime, dat$Voltage, type = "o", pch = "", xlab = "datetime", ylab = "Voltage")
# plot 3
plot(dat$datetime, dat$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(dat$datetime, dat$Sub_metering_1, col = "black")
lines(dat$datetime, dat$Sub_metering_2, col = "red")
lines(dat$datetime, dat$Sub_metering_3, col = "blue")
legend(legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), x = "topright", col = c("black", "red", "blue"), lty = 1)
plot(dat$datetime, dat$Global_reactive_power, type = "o", pch = "", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()
