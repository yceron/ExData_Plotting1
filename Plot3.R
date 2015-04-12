all_data <- read.delim("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";" )

#Get a subset of only the days needed for the plot 2007-02-01 and 2007-02-02
#Note: Date is specified in dd/mm/yyyy
plot_data <- subset(all_data, all_data$Date =='1/2/2007' | all_data$Date =='2/2/2007')

#Create a Datetime column
plot_data$Datetime <- as.POSIXct(paste(as.Date(plot_data$Date, "%d/%m/%Y"), plot_data$Time))


#Plot 3
png(filename = "plot3.png", bg="white", width = 480, height = 480, units = "px")
# sub metering 1 (black)
plot(plot_data$Sub_metering_1 ~ plot_data$Datetime, type="l", ylab="Energy sub metering", xlab="", col="black")
# sub metering 2 (red)
lines(plot_data$Sub_metering_2 ~ plot_data$Datetime, col="red")
# sub metering 3 (blue)
lines(plot_data$Sub_metering_3 ~ plot_data$Datetime, col="blue")
#Legends
legend("topright",col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty= 1 , lwd =1)
dev.off()


