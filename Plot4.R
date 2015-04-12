all_data <- read.delim("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";" )

#Get a subset of only the days needed for the plot 2007-02-01 and 2007-02-02
#Note: Date is specified in dd/mm/yyyy
plot_data <- subset(all_data, all_data$Date =='1/2/2007' | all_data$Date =='2/2/2007')

#Create a Datetime column
plot_data$Datetime <- as.POSIXct(paste(as.Date(plot_data$Date, "%d/%m/%Y"), plot_data$Time))


#Plot 4
png(filename = "plot4.png", bg="white", width = 480, height = 480, units = "px")

#Setting the style params
par(mfrow = c(2,2),   #how many plots per col, rows
    mar = c(4,4,2,1), #margin
    oma = c(0,0,2,0)) #outer margins

##Plots
#Plot #1 - Global Active Power ~ Datetime
plot(plot_data$Global_active_power ~ plot_data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#Plot #2 - Voltage ~ Datetime
plot(plot_data$Voltage ~ plot_data$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
#Plot #3 - Energy sub metering( all 3) ~ Datetime
plot(plot_data$Sub_metering_1 ~ plot_data$Datetime, type = "l", ylab = "Energy sub metering", xlab = "", col ="black")
lines(plot_data$Sub_metering_2 ~ plot_data$Datetime, col = 'Red')
lines(plot_data$Sub_metering_3 ~ plot_data$Datetime, col = 'Blue')
#Legends for plot #3
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,  bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Global reactive power ~ Datetime
plot(plot_data$Global_reactive_power ~ plot_data$Datetime, type = "l",  ylab = "Global_rective_power", xlab = "datetime")
dev.off()