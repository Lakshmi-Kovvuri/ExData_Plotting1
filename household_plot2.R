fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"household.zip"
download.file(fileUrl, zipfile)

if(file.exists(zipfile))
unzip(zipfile)

powerfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
stringsAsFactors=FALSE)

required_data<-powerfile[powerfile$Date %in% c("1/2/2007", "2/2/2007"),]

dateTime<-strptime(paste(required_data$Date, required_data$Time, sep=" "),
"%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(required_data$Global_active_power)

png("plot2.png", width=480, height=480)

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power(kilowatts)")
