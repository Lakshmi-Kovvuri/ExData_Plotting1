# Downloading the household power consumption data
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"household.zip"
download.file(fileUrl, zipfile)

if(file.exists(zipfile))
unzip(zipfile)

# Read the 'household power consumption' text file
powerfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
stringsAsFactors=FALSE)

# Extracting the data of February 1st and 2nd of 2007 dates
required_data<-powerfile[powerfile$Date %in% c("1/2/2007", "2/2/2007"),]

# Formatting 'Date' and 'Time'
dateTime<-strptime(paste(required_data$Date, required_data$Time, sep=" "),
"%d/%m/%Y %H:%M:%S")

# Converting 'Global_active_power' column to numeric type
Global_active_power <- as.numeric(required_data$Global_active_power)

# Saving the graph into plot2.png file
png("plot2.png", width=480, height=480)

# Plot for the Global_active_power
plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()
