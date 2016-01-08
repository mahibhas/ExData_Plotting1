library(data.table);
data <- fread("household_power_consumption.txt",sep=";",na.strings="?");
data <- subset(data, Date=="1/2/2007"| Date =="2/2/2007");
data <- data[complete.cases(data),];
data[, Date_Time := paste(Date,Time)];
data[, Date_Time := as.POSIXct(Date_Time, format="%d/%m/%Y %H:%M:%S", tz="GMT")];
png(file = "Plot1.png",width = 480, height = 480);
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power");
dev.off()