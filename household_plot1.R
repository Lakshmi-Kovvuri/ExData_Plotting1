# Downloading the household power consumption data

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"household.zip"
download.file(fileUrl, zipfile)

if(file.exists(zipfile))
unzip(zipfile)

# Read the household power consumption text file
powerfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
stringsAsFactors=FALSE)

#Converting the 'Date' column to Date type
powerfile$Date<-as.Date(powerfile$Date, "%d/%m/%Y")

# Extracting the data of February 1st & 2nd of 2007 dates
powerfile<-subset(powerfile, Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))

# Changing the 'Global_active_power' column to numeric type
globalActivePower<-as.numeric(powerfile$Global_active_power)

# Saving the graph in plot1.png
png("plot1.png", width=480, height=480)

# Histogram of "Global Active Power"
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()
