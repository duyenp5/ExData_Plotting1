# R codes for Plot 2
# Step 1: Get data from "Individual household electric power consumption Data Set"
source_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', quote='\"', na.strings="?", nrows=2075259, check.names=F, comment.char="", stringsAsFactors=F)
# Step 2: Filter the date needed by date range
source_data$Date <- as.Date(source_data$Date, format="%d/%m/%Y")
filtered_data <- subset(source_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
filtered_data$convertdate <- as.POSIXct(paste(as.Date(filtered_data$Date), filtered_data$Time))
# Step 3: Plot the time series line graph
plot(filtered_data$Global_active_power ~ filtered_data$convertdate, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# Step 4: Save the graph as png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()