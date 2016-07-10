# Submitter:    Steve Morin
# Date:         July 09th, 2016
# 
# Course: Exploratory Data Analysis
# Assignment: Course Project 1
#

# Set the Working Directory
setwd("D:\\Coursera\\Data Science Specialization\\Exploratory Data Analysis\\Course Project 1\\household_power_consumption\\")

# Read the list of features from features.txt file
power_data<-read.table(".\\household_power_consumption.txt",header=TRUE,sep=";")

# Convert Global_active_power to character and then to numeric data type
power_data$Global_active_power <- as.numeric(as.character(power_data$Global_active_power))

# Get a subset of data for Feb 1 & 2, 2007
subset_power_data <- power_data[(power_data$Date =="1/2/2007"|power_data$Date =="2/2/2007"),]

# Reformat date and append time to create a date time field
subset_power_data$Date<-strptime(paste(subset_power_data$Date,subset_power_data$Time,sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot the data
plot(subset_power_data$Date,subset_power_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Save the plot to the file
dev.copy(png, file="plot2.png",width=480, height=480)

# Reset the output device
 dev.off()

