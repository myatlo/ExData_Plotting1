plot1<-function () {
	#read data from the file
	data<-read.table("household_power_consumption.txt",skip=66637,nrow=2880,sep=";")
	#build histogram
	hist(data$V3,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
	#copy histogram to png
	dev.copy(png,file="plot1.png",height=480,width=480)
	dev.off()
	NULL
}