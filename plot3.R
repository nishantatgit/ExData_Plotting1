c_data <- read.csv(file="household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
c_data <- transform(c_data, Date = as.Date(Date,"%d/%m/%Y"))
f_data <- subset(c_data, Date >= "2007-02-01" & Date <= "2007-02-02")
f_data <- transform(f_data,Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3))
plot(as.POSIXct(paste(f_data$Date, f_data$Time), format="%Y-%m-%d %H:%M:%S"), f_data$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="")
points(as.POSIXct(paste(f_data$Date, f_data$Time), format="%Y-%m-%d %H:%M:%S"), f_data$Sub_metering_2, type = "l", col = "Red")
points(as.POSIXct(paste(f_data$Date, f_data$Time), format="%Y-%m-%d %H:%M:%S"), f_data$Sub_metering_3, type = "l", col = "Blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue") , lty = c(1,1,1))
dev.copy(png, file="plot3.png", width = 480 , height = 480 , units = "px")
dev.off(which = dev.cur())
