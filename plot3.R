plot3<-function () {
	#read data from the file
	data<-read.table("household_power_consumption.txt",skip=66637,nrow=2880,sep=";")
	#date and time conversion
	data$V1<-as.character(data$V1)
	data$V2<-as.character(data$V2)
	z<-paste(data$V1,data$V2)
	date<-strptime(z,format="%d/%m/%Y %H:%M:%S")
	#build graph
	#save current system's locale
	locale <- Sys.getlocale(category = "LC_TIME")
	#set English locale in order to have labels printed in English
	Sys.setlocale("LC_TIME", "English")
	plot(date,data$V7,ylab="Energy sub metering",xlab="",pch=1,type="l")
	points(date,data$V8,pch=1,type="l",col="red")
	points(date,data$V9,pch=1,type="l",col="blue")
	legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		col=c("black","red","blue"),cex=0.75,xjust=0.75)
	#copy graph to png
	dev.copy(png,file="plot3.png",height=480,width=480)
	dev.off()
	# restore system's original locale
	Sys.setlocale("LC_TIME", locale)
	NULL
}