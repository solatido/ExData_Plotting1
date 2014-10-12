require(sqldf)

setwd("~/projects/datasciencecoursera/explore/a1/ExData_Plotting1")

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
selectOnlyDates <- "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007')"
outputpng <- "plot2.png"

# Download data to temp file, unzip, read in data to R, remove temp file
tmpzippedfile <- tempfile()
#download.file(fileURL, tmpzippedfile, method = "curl")
tmpdir <- tempdir()
#unzippedData <- unzip(tmpzippedfile, exdir = tmpdir)
unzippedData = "~/projects/datasciencecoursera/explore/a1/household_power_consumption.txt"
dat <- read.csv.sql(unzippedData, sql = selectOnlyDates, sep = ";", header = TRUE)
unlink(tmpzippedfile)
unlink(tmpdir)

# Open png, write out graph, close png
png(file=outputpng,width = 480, height = 480)

activePowerByDatetime <- data.frame(dat$Global_active_power, strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S"))
colnames(activePowerByDatetime) <- c("ActivePower", "Time")
plot(activePowerByDatetime$Time, activePowerByDatetime$ActivePower, type = "o", pch = "", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
