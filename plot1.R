# R codes for Plot 1
# Step 1: Get data from "Individual household electric power consumption Data Set"
source_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', quote='\"', na.strings="?", nrows=2075259, check.names=F, comment.char="", stringsAsFactors=F)
# Step 2: Filter the date needed by date range
source_data$Date <- as.Date(source_data$Date, format="%d/%m/%Y")
filtered_data <- subset(source_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Step 3: Plot the histogram
hist(filtered_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="OrangeRed")
# Step 4: Save the graph as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()