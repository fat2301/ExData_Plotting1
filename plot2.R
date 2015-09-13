library(data.table)

colClasses<-c("Date", "character", "character", "character", "character", "character", "character", "character", "numeric")


mydata<-fread("household_power_consumption.txt",header=TRUE,verbose=TRUE, sep=';', na.strings=c("?","","null","NA",'x',"","NULL"), 
                 colClasses=colClasses)


mydata2<- mydata[mydata$Date == '1/2/2007'| mydata$Date== '2/2/2007']

mydata4<- mydata2[,dt:=as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))]


mydata5<- mydata4[,Global_active_power:=as.numeric(Global_active_power)]
mydata6<- mydata5[,Global_reactive_power:=as.numeric(Global_reactive_power)]
mydata7<- mydata6[,Voltage:=as.numeric(Voltage)]
mydata8<- mydata7[,Global_intensity:=as.numeric(Global_intensity)]
mydata9<- mydata8[,Sub_metering_1:=as.numeric(Sub_metering_1)]
mydata10<- mydata9[,Sub_metering_2:=as.numeric(Sub_metering_2)]



png(filename="plot2.png",widt=480, height=480, units="px")
with(mydata10, plot(dt,Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()

