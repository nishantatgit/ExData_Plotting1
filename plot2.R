c_data <- read.csv(file="household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
c_data <- transform(c_data, Date = as.Date(Date,"%d/%m/%Y"))
f_data <- subset(c_data, Date >= "2007-02-01" & Date <= "2007-02-02")
f_data <- transform(f_data,Global_active_power = as.numeric(Global_active_power))
plot(as.POSIXct(paste(f_data$Date, f_data$Time), format="%Y-%m-%d %H:%M:%S"), f_data$Global_active_power, type = "l", ylab="Global Active Power(killowatts)", xlab="")
dev.copy(png, file="plot2.png", width = 480 , height = 480 , units = "px")
dev.off(which = dev.cur())
