require(sqldf)

setwd("~/projects/datasciencecoursera/explore/a1/ExData_Plotting1")

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
selectOnlyDates <- "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007')"
outputpng <- "plot1.png"

tmpzippedfile <- tempfile()
# Download data to temp file, unzip, read in data to R, remove temp file
download.file(fileURL, tmpzippedfile, method = "curl")
tmpdir <- tempdir()
unzippedData <- unzip(tmpzippedfile, exdir = tmpdir)
dat <- read.csv.sql(unzippedData, sql = selectOnlyDates, sep = ";", header = TRUE)
unlink(tmpzippedfile)
unlink(tmpdir)

# Open png, write out graph, close png
png(file=outputpng,width = 480, height = 480)

hist(dat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
