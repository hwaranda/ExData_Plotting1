#After manually downloading and uncompressing the file, we need to read data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

# Convert to Date and Time
data$Time<-paste(as.character(data$Date),as.character(data$Time))
data$Date<-as.Date(as.character(data$Date),format="%d/%m/%Y")
data$Time<-strptime(data$Time,format="%d/%m/%Y %H:%M:%S")

#Subset the data
data <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")

# Convert to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#Exporting the plot to a file
png(filename="plot2.png",width=480,height=480,units="px")
with(data,plot(Time,Global_active_power/500,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()


