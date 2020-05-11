# Downloading household power consumption data
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"household.zip"
download.file(fileUrl, zipfile)

if(file.exists(zipfile))
unzip(zipfile)

# Read the household power consumption text file
powerfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
stringsAsFactors=FALSE)

# Extracting the data of February 1st and 2nd of 2007 dates
requiredData<-powerfile[powerfile$Date %in% c("1/2/2007", "2/2/2007"),]

# Formatting 'Date' and 'Time'
dateTime<-strptime(paste(requiredData$Date, requiredData$Time, sep=" "),
"%d/%m/%Y %H:%M:%S")

# Converting the data to numeric
Global_active_power<-as.numeric(requiredData$Global_active_power)

Sub_metering_1<-as.numeric(requiredData$Sub_metering_1)
Sub_metering_2<-as.numeric(requiredData$Sub_metering_2)
Sub_metering_3<-as.numeric(requiredData$Sub_metering_3)

# Saving the graph into plot3.png file
png("plot3.png", width=480, height=480)

# Plotting the graph for Submetering_1, Submetering_2, Submetering_3
plot(dateTime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab=" ")
lines(dateTime, Sub_metering_2, type="l", col="red")
lines(dateTime, Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

