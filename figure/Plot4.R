library(data.table);
data <- fread("household_power_consumption.txt",sep=";",na.strings="?");
data <- subset(data, Date=="1/2/2007"| Date =="2/2/2007");
data <- data[complete.cases(data),];
data[, Date_Time := paste(Date,Time)];
data[, Date_Time := as.POSIXct(Date_Time, format="%d/%m/%Y %H:%M:%S", tz="GMT")];
png(file = "Plot4.png",width = 480, height = 480);
par(mfcol=c(2,2),mar=c(4,4,2,2));
with(data,plot(Date_Time, Global_active_power,pch='.',xlab="",ylab="Global Active Power (kilowatts)",type="n"));
lines(data$Date_Time, data$Global_active_power);
with(data,plot(Date_Time, Sub_metering_1,pch='.',xlab="",ylab="Energy sub metering",type="n"));
lines(data$Date_Time, data$Sub_metering_1,col="black");
lines(data$Date_Time, data$Sub_metering_2,col="red");
lines(data$Date_Time, data$Sub_metering_3,col="blue");
legend("topright",pch="-",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lwd = 0,box.col = "white",bg = "white");
box(col="black")
with(data,plot(Date_Time, Voltage,pch='.',xlab="datetime",ylab="Voltage",type="n"));
lines(data$Date_Time, data$Voltage);
with(data,plot(Date_Time, Global_reactive_power,pch='.',xlab="datetime",type="n"));
lines(data$Date_Time, data$Global_reactive_power);
dev.off()