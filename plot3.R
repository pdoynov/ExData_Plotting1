#Load the dataset
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")
#Get the data for the required time period
sdata <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
#Omit NA values
omit.NA.sdata <- na.omit(sdata)
#Create new DateTime variable for the plots
sdata$DateTime <- paste(sdata$Date, sdata$Time)
sdata$DateTime <- strptime(sdata$DateTime, format = "%d/%m/%Y %H:%M:%S") 
#Generate the plot to PNG file
png(file = "plot3.png", bg = "white", width = 480, height = 480)
plot(sdata$DateTime, sdata$Sub_metering_1, type = "l", col  = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(sdata$DateTime, sdata$Sub_metering_2, col = "red")
lines(sdata$DateTime, sdata$Sub_metering_3, col = "blue")
legend("topright", pch = '___', border = "white", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#close the graph device
dev.off()