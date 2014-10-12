require(sqldf)

setwd("~/projects/datasciencecoursera/explore/a1/ExData_Plotting1")

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
selectOnlyDates <- "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007')"
outputpng <- "plot3.png"

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

subMeteringByDatetime <- data.frame(dat$Sub_metering_1, dat$Sub_metering_2, dat$Sub_metering_3, strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S"))
colnames(subMeteringByDatetime) <- c("sub1", "sub2", "sub3", "Time")
plot(subMeteringByDatetime$Time, subMeteringByDatetime$sub1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(subMeteringByDatetime$Time, subMeteringByDatetime$sub1, col = "black")
lines(subMeteringByDatetime$Time, subMeteringByDatetime$sub2, col = "red")
lines(subMeteringByDatetime$Time, subMeteringByDatetime$sub3, col = "blue")
legend(legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), x = "topright", col = c("black", "red", "blue"), lty = 1)

dev.off()
