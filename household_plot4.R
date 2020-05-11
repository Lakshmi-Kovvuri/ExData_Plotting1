# Downloading the household power consumption data
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"household.zip"

download.file(fileUrl, zipfile)

if(file.exists(zipfile))
unzip(zipfile)

# Reading the household power consumption text file
powerfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                       stringsAsFactors=FALSE)

# Extracting the data of February 1st and 2nd of 2007 dates
requiredData <- powerfile[powerfile$Date %in% c("1/2/2007","2/2/2007") ,]

# Formatting the 'Date' and 'Time'
dateTime<-strptime(paste(requiredData$Date, requiredData$Time, sep=""), "%d/%m/%Y %H:%M:%S")

# Converting the data to numeric type
Global_active_power<-as.numeric(requiredData$Global_active_power)
Voltage<-as.numeric(requiredData$Voltage)

Sub_metering_1<-as.numeric(requiredData$Sub_metering_1)
Sub_metering_2<-as.numeric(requiredData$Sub_metering_2)
Sub_metering_3<-as.numeric(requiredData$Sub_metering_3)

Global_reactive_power<-as.numeric(requiredData$Global_reactive_power)


# Saving the graph into plot4.png
png("plot4.png", width=480, height=480)

# Setting the parameters for subplots
par(mfrow=c(2,2))

# Graph for 'Global_active-power'
plot(dateTime, Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type="l", cex=0.2)

# Graph for 'Voltage'
plot(dateTime, Voltage, xlab="", ylab="Voltage", type="l")

# Graph for 'Submetering'
plot(dateTime, Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(dateTime, Sub_metering_2, type="l", col="red")
lines(dateTime, Sub_metering_3, type="l", col="blue")
legend("topright", c(Sub_metering_1, Sub_metering_2, Sub_metering_3), col=("black","red","blue"), lty="l", lwd=2.5, bty="0")

# Graph for 'Global_reactive_power'
plot(dateTime, Global_reactive_power, xlab="", ylab="Global Reactive Power(kilowatts)",type="l")

# Shutting down the device
dev.off()
