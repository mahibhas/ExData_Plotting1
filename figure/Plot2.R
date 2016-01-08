library(data.table);
data <- fread("household_power_consumption.txt",sep=";",na.strings="?");
data <- subset(data, Date=="1/2/2007"| Date =="2/2/2007");
data <- data[complete.cases(data),];
data[, Date_Time := paste(Date,Time)];
data[, Date_Time := as.POSIXct(Date_Time, format="%d/%m/%Y %H:%M:%S", tz="GMT")];
png(file = "Plot2.png",width = 480, height = 480);
with(data,plot(Date_Time, Global_active_power,pch='.',xlab="",ylab="Global Active Power (kilowatts)",type="n"));
lines(data$Date_Time, data$Global_active_power);
dev.off()