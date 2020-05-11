fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"household.zip"
download.file(fileUrl, zipfile)

if(file.exists(zipfile))
unzip(zipfile)

powerfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
stringsAsFactors=FALSE)

powerfile$Date<-as.Date(powerfile$Date, "%d/%m/%Y")

powerfile<-subset(powerfile, Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))


globalActivePower<-as.numeric(powerfile$Global_active_power)

png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()