require(sqldf)

defaultDataFile = "~/projects/datasciencecoursera/explore/a1/household_power_consumption.txt"
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
selectOnlyDates <- "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007')"

# Return a data frame based on power consumption data as specified at
# https://class.coursera.org/exdata-007/human_grading/view/courses/972594/assessments/3/submissions
# Use local copy of data if available, else download required file.
# Parameters: forceDownload [default:FALSE]: If TRUE, download data even if data already exists locally.
getPowerConsumptionDataFrame <- function(forceDownload=FALSE) {
  
  tmpZippedFile = ""
  tmpDir = ""
  
  # If we don't already have the unzipped file or option forceDownload=TRUE, download data
  if (!file.exists(defaultDataFile) | forceDownload) {
    
    # Download data to temp file, unzip, read in data to R, remove temp file
    tmpZippedFile <- tempfile()
    tmpdir <- tempdir()
    download.file(fileURL, tmpZippedFile, method = "curl")
    unzippedData <- unzip(tmpZippedFile, exdir = tmpdir)
  } else {
    unzippedData <- defaultDataFile
  }
  
  # Read in only relevant dates' data rows
  data <- read.csv.sql(unzippedData, sql = selectOnlyDates, sep = ";", header = TRUE)
  
  # Add datetime column based on string date and time columns from original data
  data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  
  # Clean up temp files, if any
  unlink(tmpZippedFile)
  unlink(tmpdir)
  
  # Return dataframe containing only relevant rows, with added datetime column
  return(data)
}