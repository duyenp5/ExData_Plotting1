# R codes for Plot 4
# Step 1: Get data from "Individual household electric power consumption Data Set"
source_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', quote='\"', na.strings="?", nrows=2075259, check.names=F, comment.char="", stringsAsFactors=F)
# Step 2: Filter the date needed by date range
source_data$Date <- as.Date(source_data$Date, format="%d/%m/%Y")
filtered_data <- subset(source_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
filtered_data$convertdate <- as.POSIXct(paste(as.Date(filtered_data$Date), filtered_data$Time))
# Step 3: Plot the time series line graph
par(mfrow=c(2,2), mar=c(4,4,1,1))
with(filtered_data, 
     {
      ## Top left graph
      plot(Global_active_power~convertdate, type="l", ylab="Global Active Power (kilowatts)", xlab="")
      ## Top right graph
      plot(Voltage~convertdate, type="l", ylab="Voltage (volt)", xlab="datetime")
      ## Bottom left graph
      plot(Sub_metering_1~convertdate, type="l", ylab="Energy sub metering", xlab="")
      lines(Sub_metering_2~convertdate, col="Red")
      lines(Sub_metering_3~convertdate, col="Blue")
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      ## Bottom right graph
      plot(Global_reactive_power~convertdate, type="l", xlab="datetime")
     })
# Step 4: Save the graph as png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()