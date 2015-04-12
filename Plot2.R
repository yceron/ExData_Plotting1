all_data <- read.delim("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";" )

#Get a subset of only the days needed for the plot 2007-02-01 and 2007-02-02
#Note: Date is specified in dd/mm/yyyy
plot_data <- subset(all_data, all_data$Date =='1/2/2007' | all_data$Date =='2/2/2007')

#Create a Datetime column
plot_data$Datetime <- as.POSIXct(paste(as.Date(plot_data$Date, "%d/%m/%Y"), plot_data$Time))


#Plot 2
png(filename = "plot2.png", bg="white", width = 480, height = 480, units = "px")
plot(plot_data$Global_active_power ~ plot_data$Datetime, 
     type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

