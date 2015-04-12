all_data <- read.delim("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";" )

#Get a subset of only the days needed for the plot 2007-02-01 and 2007-02-02
#Note: Date is specified in dd/mm/yyyy
plot_data <- subset(all_data, all_data$Date =='1/2/2007' | all_data$Date =='2/2/2007')

#Create a Datetime column
plot_data$Datetime <- as.POSIXct(paste(as.Date(plot_data$Date, "%d/%m/%Y"), plot_data$Time))


#Plot 1
png(filename = "plot1.png", bg="white", width = 480, height = 480, units = "px")
hist(plot_data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power(kilowatts)",breaks=12, ylim= c(0,1200))
dev.off()

