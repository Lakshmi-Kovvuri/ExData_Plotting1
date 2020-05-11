fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"household.zip"
download.file(fileUrl, zipfile)

if(file.exists(zipfile))
unzip(zipfile)

powerfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
stringsAsFactors=FALSE)

requiredData<-powerfile[powerfile$Date %in% c("1/2/2007", "2/2/2007"),]

dateTime<-strptime(paste(requiredData$Date, requiredData$Time, sep=" "),
"%d/%m/%Y %H:%M:%S")


globalActivePower<-as.numeric(requiredData$Global_active_power)

Sub_metering_1<-as.numeric(requiredData$Sub_metering_1)
Sub_metering_2<-as.numeric(requiredData$Sub_metering_2)
Sub_metering_3<-as.numeric(requiredData$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(dateTime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab=" ")
lines(dateTime, Sub_metering_2, type="l", col="red")
lines(dateTime, Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

